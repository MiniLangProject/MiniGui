// SPDX-License-Identifier: Apache-2.0
// Additional native controls. Their HWNDs are ordinary MiniGui child windows.
#define NOMINMAX
#include <WebView2.h>
#include <algorithm>
#include <commctrl.h>
#include <memory>
#include <richedit.h>
#include <shellapi.h>
#include <shlobj.h>
#include <string>
#include <vector>
#include <windows.h>
#include <wrl.h>
using Microsoft::WRL::Callback;
using Microsoft::WRL::ComPtr;
#define API extern "C" __declspec(dllexport)
static const UINT TrayMessage = WM_APP + 48;
struct Draw {
  int op, x, y, w, h;
  COLORREF color;
  std::wstring text;
};
struct State {
  HWND hwnd{};
  std::wstring kind, pending;
  bool html{}, alive{true}, highlighting{};
  std::wstring language;
  NOTIFYICONDATAW tray{};
  HMENU menu{};
  HFONT font{};
  ComPtr<ICoreWebView2Controller> controller;
  ComPtr<ICoreWebView2> web;
  std::vector<Draw> drawing;
  HRESULT status{E_PENDING};
};
static std::vector<std::shared_ptr<State>> states;
static std::wstring wide(const char *s) {
  if (!s)
    return {};
  int count = MultiByteToWideChar(CP_UTF8, 0, s, -1, nullptr, 0);
  std::wstring w(count, 0);
  MultiByteToWideChar(CP_UTF8, 0, s, -1, w.data(), count);
  if (!w.empty())
    w.pop_back();
  return w;
}
static COLORREF color(const char *s) {
  unsigned v = 0;
  if (s && *s == '#')
    sscanf_s(s + 1, "%x", &v);
  return RGB((v >> 16) & 255, (v >> 8) & 255, v & 255);
}
static std::shared_ptr<State> find(HWND hwnd) {
  for (auto &s : states)
    if (s->hwnd == hwnd && s->alive)
      return s;
  return {};
}
static void bounds(State &s) {
  if (s.controller) {
    RECT r;
    GetClientRect(s.hwnd, &r);
    s.controller->put_Bounds(r);
  }
}
static LRESULT CALLBACK hostProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
  auto s = find(hwnd);
  if (s) {
    if (msg == WM_SIZE)
      bounds(*s);
    if (msg == WM_PAINT) {
      PAINTSTRUCT ps;
      HDC dc = BeginPaint(hwnd, &ps);
      FillRect(dc, &ps.rcPaint, (HBRUSH)(COLOR_WINDOW + 1));
      SetBkMode(dc, TRANSPARENT);
      for (auto &d : s->drawing) {
        HPEN pen = CreatePen(PS_SOLID, 1, d.color);
        HGDIOBJ old = SelectObject(dc, pen);
        SetTextColor(dc, d.color);
        if (d.op == 1) {
          MoveToEx(dc, d.x, d.y, nullptr);
          LineTo(dc, d.w, d.h);
        }
        if (d.op == 2) {
          RECT r{d.x, d.y, d.x + d.w, d.y + d.h};
          HBRUSH b = CreateSolidBrush(d.color);
          FillRect(dc, &r, b);
          DeleteObject(b);
        }
        if (d.op == 3)
          TextOutW(dc, d.x, d.y, d.text.c_str(), (int)d.text.size());
        SelectObject(dc, old);
        DeleteObject(pen);
      }
      EndPaint(hwnd, &ps);
      return 0;
    }
    if (msg == TrayMessage) {
      if (lp == WM_LBUTTONUP) {
        SendMessageW(GetParent(hwnd), WM_COMMAND,
                     MAKEWPARAM(GetDlgCtrlID(hwnd), BN_CLICKED), (LPARAM)hwnd);
      }
      if (lp == WM_RBUTTONUP && s->menu) {
        POINT p;
        GetCursorPos(&p);
        SetForegroundWindow(GetAncestor(hwnd, GA_ROOT));
        UINT chosen = TrackPopupMenu(s->menu, TPM_RETURNCMD | TPM_NONOTIFY, p.x,
                                     p.y, 0, hwnd, nullptr);
        if (chosen) {
          SetPropW(hwnd, L"MiniGuiTraySelection", (HANDLE)(INT_PTR)chosen);
          SendMessageW(GetParent(hwnd), WM_COMMAND,
                       MAKEWPARAM(GetDlgCtrlID(hwnd), BN_CLICKED),
                       (LPARAM)hwnd);
        }
      }
      return 0;
    }
    if (msg == WM_NCDESTROY) {
      s->alive = false;
      if (s->tray.cbSize)
        Shell_NotifyIconW(NIM_DELETE, &s->tray);
      if (s->controller)
        s->controller->Close();
      s->controller.Reset();
      s->web.Reset();
      if (s->menu)
        DestroyMenu(s->menu);
      if (s->font)
        DeleteObject(s->font);
      states.erase(std::remove(states.begin(), states.end(), s), states.end());
    }
  }
  return DefWindowProcW(hwnd, msg, wp, lp);
}
static void highlight(const std::shared_ptr<State> &s) {
  if (!s || s->language.empty() || s->highlighting)
    return;
  s->highlighting = true;
  HWND h = s->hwnd;
  int length = GetWindowTextLengthW(h);
  std::wstring text(length + 1, 0);
  GetWindowTextW(h, text.data(), length + 1);
  text.resize(length);
  CHARRANGE selected;
  SendMessageW(h, EM_EXGETSEL, 0, (LPARAM)&selected);
  auto paint = [&](int start, int end, COLORREF color) {
    CHARRANGE r{start, end};
    SendMessageW(h, EM_EXSETSEL, 0, (LPARAM)&r);
    CHARFORMAT2W cf{};
    cf.cbSize = sizeof cf;
    cf.dwMask = CFM_COLOR;
    cf.crTextColor = color;
    SendMessageW(h, EM_SETCHARFORMAT, SCF_SELECTION, (LPARAM)&cf);
  };
  SendMessageW(h, WM_SETREDRAW, FALSE, 0);
  paint(0, length, RGB(32, 32, 32));
  const std::wstring keywords =
      L" function end if then else for each in while return print import "
      L"package struct static const global true false void class def pass from "
      L"as and or not switch case break continue ";
  for (int i = 0; i < length;) {
    int begin = i;
    if (text[i] == L'"' || text[i] == L'\'') {
      wchar_t q = text[i++];
      while (i < length) {
        if (text[i] == L'\\') {
          i = std::min(i + 2, length);
          continue;
        }
        if (text[i++] == q)
          break;
      }
      paint(begin, i, RGB(160, 60, 40));
    } else if (text[i] == L'#' ||
               (i + 1 < length && text[i] == L'/' && text[i + 1] == L'/')) {
      while (i < length && text[i] != L'\n')
        i++;
      paint(begin, i, RGB(40, 130, 65));
    } else if (iswalpha(text[i]) || text[i] == L'_') {
      while (i < length && (iswalnum(text[i]) || text[i] == L'_'))
        i++;
      if (keywords.find(L" " + text.substr(begin, i - begin) + L" ") !=
          std::wstring::npos)
        paint(begin, i, RGB(55, 80, 185));
    } else
      i++;
  }
  SendMessageW(h, EM_EXSETSEL, 0, (LPARAM)&selected);
  SendMessageW(h, WM_SETREDRAW, TRUE, 0);
  InvalidateRect(h, nullptr, FALSE);
  s->highlighting = false;
}
static LRESULT CALLBACK fontProc(HWND h, UINT m, WPARAM w, LPARAM l,
                                 UINT_PTR id, DWORD_PTR) {
  if (m == WM_NCDESTROY) {
    HANDLE f = RemovePropW(h, L"MiniGuiOwnedFont");
    if (f)
      DeleteObject(f);
    RemoveWindowSubclass(h, fontProc, id);
  }
  return DefSubclassProc(h, m, w, l);
}
static LRESULT CALLBACK richProc(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp,
                                 UINT_PTR id, DWORD_PTR data) {
  if (msg == WM_CHAR || msg == WM_PASTE || msg == WM_SETTEXT)
    SetTimer(hwnd, 42, 100, nullptr);
  if (msg == WM_TIMER && wp == 42) {
    KillTimer(hwnd, 42);
    highlight(find(hwnd));
    return 0;
  }
  if (msg == WM_KEYDOWN && wp == VK_TAB) {
    SendMessageW(hwnd, EM_REPLACESEL, TRUE, (LPARAM)L"  ");
    return 0;
  }
  if (msg == WM_NCDESTROY) {
    auto s = find(hwnd);
    if (s) {
      s->alive = false;
      if (s->font)
        DeleteObject(s->font);
      states.erase(std::remove(states.begin(), states.end(), s), states.end());
    }
    RemoveWindowSubclass(hwnd, richProc, id);
  }
  return DefSubclassProc(hwnd, msg, wp, lp);
}
API HWND mx_create(const char *kind, HWND parent, int64_t id, const char *text,
                   int64_t x, int64_t y, int64_t width, int64_t height) {
  static HMODULE rich = LoadLibraryW(L"Msftedit.dll");
  (void)rich;
  static bool registered = []() {
    WNDCLASSW wc{};
    wc.lpfnWndProc = hostProc;
    wc.hInstance = GetModuleHandleW(nullptr);
    wc.lpszClassName = L"MiniGuiExtra";
    wc.hCursor = LoadCursorW(nullptr, IDC_ARROW);
    return RegisterClassW(&wc) != 0;
  }();
  (void)registered;
  auto s = std::make_shared<State>();
  s->kind = wide(kind);
  bool edit = s->kind == L"RichTextBox" || s->kind == L"CodeEditor";
  DWORD style = WS_CHILD | WS_VISIBLE | WS_TABSTOP;
  if (edit)
    style |=
        ES_MULTILINE | ES_AUTOVSCROLL | ES_WANTRETURN | WS_VSCROLL | WS_HSCROLL;
  HWND hwnd = CreateWindowExW(
      edit ? WS_EX_CLIENTEDGE : 0, edit ? MSFTEDIT_CLASS : L"MiniGuiExtra",
      wide(text).c_str(), style, (int)x, (int)y, (int)width, (int)height,
      parent, (HMENU)(INT_PTR)id, GetModuleHandleW(nullptr), nullptr);
  if (!hwnd)
    return nullptr;
  s->hwnd = hwnd;
  states.push_back(s);
  if (edit) {
    SendMessageW(hwnd, EM_SETEVENTMASK, 0, ENM_CHANGE);
    SetWindowSubclass(hwnd, richProc, 1, 0);
    if (s->kind == L"CodeEditor") {
      s->font = CreateFontW(-14, 0, 0, 0, FW_NORMAL, FALSE, FALSE, FALSE,
                            DEFAULT_CHARSET, 0, 0, CLEARTYPE_QUALITY,
                            FIXED_PITCH, L"Consolas");
      SendMessageW(hwnd, WM_SETFONT, (WPARAM)s->font, TRUE);
    }
  }
  if (s->kind == L"TrayIcon") {
    s->tray.cbSize = sizeof(s->tray);
    s->tray.hWnd = hwnd;
    s->tray.uID = 1;
    s->tray.uFlags = NIF_MESSAGE | NIF_ICON | NIF_TIP;
    s->tray.uCallbackMessage = TrayMessage;
    s->tray.hIcon = LoadIconW(nullptr, IDI_APPLICATION);
    wcsncpy_s(s->tray.szTip, wide(text).c_str(), _TRUNCATE);
    Shell_NotifyIconW(NIM_ADD, &s->tray);
    ShowWindow(hwnd, SW_HIDE);
  }
  if (s->kind == L"WebView") {
    HRESULT init = CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
    if (FAILED(init) && init != RPC_E_CHANGED_MODE) {
      s->status = init;
      return hwnd;
    }
    wchar_t local[MAX_PATH];
    SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, local);
    std::wstring folder = std::wstring(local) + L"\\MiniGui\\WebView2";
    s->status = CreateCoreWebView2EnvironmentWithOptions(
        nullptr, folder.c_str(), nullptr,
        Callback<ICoreWebView2CreateCoreWebView2EnvironmentCompletedHandler>(
            [s](HRESULT hr, ICoreWebView2Environment *env) -> HRESULT {
              if (!s->alive)
                return S_OK;
              if (FAILED(hr) || !env) {
                s->status = hr;
                return S_OK;
              }
              return env->CreateCoreWebView2Controller(
                  s->hwnd,
                  Callback<
                      ICoreWebView2CreateCoreWebView2ControllerCompletedHandler>(
                      [s](HRESULT hr,
                          ICoreWebView2Controller *controller) -> HRESULT {
                        if (!s->alive) {
                          if (controller)
                            controller->Close();
                          return S_OK;
                        }
                        s->status = hr;
                        if (FAILED(hr) || !controller)
                          return S_OK;
                        s->controller = controller;
                        controller->get_CoreWebView2(&s->web);
                        bounds(*s);
                        if (!s->pending.empty()) {
                          if (s->html)
                            s->web->NavigateToString(s->pending.c_str());
                          else
                            s->web->Navigate(s->pending.c_str());
                        }
                        return S_OK;
                      })
                      .Get());
            })
            .Get());
  }
  return hwnd;
}
API int64_t mx_property(HWND hwnd, const char *key, const char *text,
                        int64_t value) {
  auto s = find(hwnd);
  std::wstring k = wide(key), t = wide(text);
  if (k == L"font") {
    HFONT font =
        CreateFontW(-(int)(value > 0 ? value : 12), 0, 0, 0, FW_NORMAL, FALSE,
                    FALSE, FALSE, DEFAULT_CHARSET, 0, 0, CLEARTYPE_QUALITY,
                    DEFAULT_PITCH, t.empty() ? L"Segoe UI" : t.c_str());
    if (!font)
      return 0;
    HANDLE old = GetPropW(hwnd, L"MiniGuiOwnedFont");
    SendMessageW(hwnd, WM_SETFONT, (WPARAM)font, TRUE);
    SetPropW(hwnd, L"MiniGuiOwnedFont", font);
    SetWindowSubclass(hwnd, fontProc, 2, 0);
    if (old)
      DeleteObject(old);
    return 1;
  }
  if (!s)
    return 0;
  if (k == L"url" || k == L"html") {
    s->pending = t;
    s->html = k == L"html";
    if (s->web) {
      HRESULT hr = s->html ? s->web->NavigateToString(t.c_str())
                           : s->web->Navigate(t.c_str());
      return SUCCEEDED(hr);
    }
    return SUCCEEDED(s->status) || s->status == E_PENDING;
  }
  if (k == L"status")
    return s->web ? 1 : (FAILED(s->status) && s->status != E_PENDING ? -1 : 0);
  if (k == L"items" && s->kind == L"TrayIcon") {
    if (s->menu)
      DestroyMenu(s->menu);
    s->menu = CreatePopupMenu();
    size_t start = 0;
    UINT i = 1;
    while (start < t.size()) {
      size_t end = t.find(L'\n', start);
      auto item = t.substr(start, end - start);
      AppendMenuW(s->menu, MF_STRING, i++, item.c_str());
      if (end == std::wstring::npos)
        break;
      start = end + 1;
    }
    return 1;
  }
  if (k == L"selectedIndex" && s->kind == L"TrayIcon")
    return (INT_PTR)GetPropW(hwnd, L"MiniGuiTraySelection") - 1;
  if (k == L"visible" && s->kind == L"TrayIcon")
    return Shell_NotifyIconW(value ? NIM_ADD : NIM_DELETE, &s->tray);
  if (k == L"icon" && s->kind == L"TrayIcon") {
    HICON icon = (HICON)LoadImageW(nullptr, t.c_str(), IMAGE_ICON, 0, 0,
                                   LR_LOADFROMFILE | LR_DEFAULTSIZE);
    if (!icon)
      return 0;
    s->tray.hIcon = icon;
    BOOL ok = Shell_NotifyIconW(NIM_MODIFY, &s->tray);
    DestroyIcon(icon);
    s->tray.hIcon = LoadIconW(nullptr, IDI_APPLICATION);
    return ok;
  }
  if (k == L"language" && s->kind == L"CodeEditor") {
    if (t != L"minilang" && t != L"python" && t != L"json" && t != L"c" &&
        t != L"cpp" && t != L"")
      return 0;
    s->language = t;
    highlight(s);
    return 1;
  }
  return 0;
}
API int64_t mx_format(HWND hwnd, int64_t start, int64_t end, const char *hex,
                      int64_t bold, int64_t italic) {
  CHARRANGE prior{}, range{(LONG)start, (LONG)end};
  SendMessageW(hwnd, EM_EXGETSEL, 0, (LPARAM)&prior);
  SendMessageW(hwnd, EM_EXSETSEL, 0, (LPARAM)&range);
  CHARFORMAT2W f{};
  f.cbSize = sizeof f;
  f.dwMask = CFM_COLOR | CFM_BOLD | CFM_ITALIC;
  f.crTextColor = color(hex);
  f.dwEffects = (bold ? CFE_BOLD : 0) | (italic ? CFE_ITALIC : 0);
  LRESULT ok = SendMessageW(hwnd, EM_SETCHARFORMAT, SCF_SELECTION, (LPARAM)&f);
  SendMessageW(hwnd, EM_EXSETSEL, 0, (LPARAM)&prior);
  return ok;
}
API void mx_draw(HWND hwnd, int64_t op, double x, double y, double w, double h,
                 const char *hex, const char *text) {
  auto s = find(hwnd);
  if (!s)
    return;
  if (!op)
    s->drawing.clear();
  else
    s->drawing.push_back(
        {(int)op, (int)x, (int)y, (int)w, (int)h, color(hex), wide(text)});
  InvalidateRect(hwnd, nullptr, TRUE);
}
API int64_t mx_pump(int64_t wait) {
  MSG msg{};
  if (wait) {
    if (GetMessageW(&msg, nullptr, 0, 0) <= 0)
      return 0;
  } else if (!PeekMessageW(&msg, nullptr, 0, 0, PM_REMOVE))
    return 0;
  TranslateMessage(&msg);
  DispatchMessageW(&msg);
  return 1;
}
