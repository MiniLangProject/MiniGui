import MiniGuiLib.minigui as MiniGui

extern function GetCurrentProcess() from "kernel32.dll" returns ptr
extern function GetGuiResources(process as ptr, flags as u32) from "user32.dll" returns u32

function main(args)
  sample = "Grüße aus 東京 🚀"
  encoded = MiniGui._utf16Z(sample)
  if decode16Z(encoded) != sample then return 1 end if

  app = MiniGui.Application.create()
  window = MiniGui.Window.create(app, "resourceWindow", "Resource smoke", 320, 180)
  label = MiniGui.Label.create(app, window, "resourceLabel", sample, 10, 10, 200, 24)
  process = GetCurrentProcess()
  before = GetGuiResources(process, 0)
  beforeUser = GetGuiResources(process, 1)

  // Replacing a background color must replace, not accumulate, GDI brushes.
  for i = 0 to 255
    if (i & 1) == 0 then
      if MiniGui.Control.setBackground(label, "#336699") == false then return 2 end if
    else
      if MiniGui.Control.setBackground(label, "#663399") == false then return 3 end if
    end if
  end for
  afterUpdates = GetGuiResources(process, 0)
  if afterUpdates > before + 4 then return 4 end if

  // Updating one control's tooltip must not leave a hidden tooltip window
  // behind for every previous value.
  for tooltipIndex = 0 to 63
    if MiniGui.Control.setTooltip(label, "Tooltip " + tooltipIndex) == false then return 5 end if
  end for
  afterTooltips = GetGuiResources(process, 1)
  if afterTooltips > beforeUser + 4 then return 6 end if

  MiniGui._releaseRuntimeResources()
  afterRelease = GetGuiResources(process, 0)
  if afterRelease > before + 2 then return 7 end if
  afterTooltipRelease = GetGuiResources(process, 1)
  if afterTooltipRelease > beforeUser + 2 then return 8 end if
  MiniGui.DestroyWindow(window.handle)
  return 0
end function
