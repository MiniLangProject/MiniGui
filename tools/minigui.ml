// SPDX-License-Identifier: Apache-2.0

//! Provides minigui facilities for this project.

import std.fs as fs
import std.string as str
import std.string_builder as sb
import std.ds.list as list
import std.process as process

/// Invokes the native _wmkdir entry point used by the minigui module.
/// @param path Path of the file or directory used by the operation.
/// @returns Native int result produced by the call.
#if TARGET_OS == "windows"
extern function _wmkdir(path as wstr) from "msvcrt.dll" returns int
/// Starts a child compiler directly, without exposing its arguments to cmd.exe.
/// @internal
extern function _CreateProcessW(applicationName as wstr, commandLine as wstr, processAttributes as ptr, threadAttributes as ptr, inheritHandles as bool, creationFlags as u32, environment as ptr, currentDirectory as ptr, startupInfo as bytes, processInformation as bytes) from "kernel32.dll" symbol "CreateProcessW" returns bool
/// Waits for a child compiler to terminate.
/// @internal
extern function _WaitForSingleObject(handle as ptr, milliseconds as u32) from "kernel32.dll" symbol "WaitForSingleObject" returns u32
/// Reads the child compiler's process exit code.
/// @internal
extern function _GetExitCodeProcess(handle as ptr, exitCode as bytes) from "kernel32.dll" symbol "GetExitCodeProcess" returns bool
/// Releases a process or thread handle returned by CreateProcessW.
/// @internal
extern function _CloseHandle(handle as ptr) from "kernel32.dll" symbol "CloseHandle" returns bool
/// Resolves an executable through the Windows search path.
/// @internal
extern function _SearchPathW(path as ptr, fileName as wstr, extension as ptr, bufferCount as u32, output as bytes, filePart as ptr) from "kernel32.dll" symbol "SearchPathW" returns u32
#else
/// @internal
extern function _mkdir(path as cstr, mode as int) from "libc.so.6" symbol "mkdir" returns int
/// @internal
extern function _fork() from "libc.so.6" symbol "fork" returns int
/// @internal
extern function _execvp(file as cstr, argv as bytes) from "libc.so.6" symbol "execvp" returns int
/// @internal
extern function _waitpid(pid as int, status as bytes, options as int) from "libc.so.6" symbol "waitpid" returns int
/// @internal
extern function _exit(code as int) from "libc.so.6" symbol "_exit" returns void
#endif


/// Maximum accepted MSON document size in UTF-8 bytes (16 MiB).
#if TARGET_OS == "windows"
const HOST_TARGET = "windows-x64"
/// Default compiler for a Windows host.
const HOST_COMPILER = "..\\MiniLangCompilerML\\build\\mlc_win64.exe"
#else
const HOST_TARGET = "linux-x64"
/// Default compiler for a Linux host.
const HOST_COMPILER = "../MiniLangCompilerPy/mlc_win64.py"
#endif
const MAX_MSON_BYTES = 16777216
/// Maximum JSON container nesting accepted by the MSON parser.
const MAX_MSON_DEPTH = 128
/// Maximum number of distinct files in one MSON import graph.
const MAX_MSON_DOCUMENTS = 4096
/// Infinite timeout value used while waiting for the compiler process.
const INFINITE = 0xFFFFFFFF
/// Maximum UTF-16 path capacity used for executable resolution.
const MAX_WINDOWS_PATH_CHARS = 32768

/// Represents the json value data used by the minigui module.
struct JsonValue
  /// Stores the kind value associated with json value.
  kind,
  /// Stores the text value associated with json value.
  text,
  /// Stores the number value associated with json value.
  number,
  /// Stores the flag value associated with json value.
  flag,
  /// Stores the keys value associated with json value.
  keys,
  /// Stores the values value associated with json value.
  values,
  /// Stores the items value associated with json value.
  items,
end struct

/// Represents the parser data used by the minigui module.
struct Parser
  /// Stores the text value associated with parser.
  text,
  /// Stores the pos value associated with parser.
  pos,
  /// Stores the errors value associated with parser.
  errors,
end struct

/// Represents the json parse result data used by the minigui module.
struct JsonParseResult
  /// Stores the ok value associated with json parse result.
  ok,
  /// Stores the value value associated with json parse result.
  value,
  /// Stores the message value associated with json parse result.
  message,
end struct

/// Represents the result data used by the minigui module.
struct Result
  /// Stores the errors value associated with result.
  errors,
  /// Stores the warnings value associated with result.
  warnings,
  /// Stores the documents value associated with result.
  documents,
  /// Stores the resources value associated with result.
  resources,
  /// Stores the components value associated with result.
  components,
  /// Stores the windows value associated with result.
  windows,
  /// Stores the events value associated with result.
  events,
  /// Stores the entry path value associated with result.
  entryPath,
  /// Stores the entry document value associated with result.
  entryDocument,
  /// Stores the code behind path value associated with result.
  codeBehindPath,
end struct

/// Represents the doc entry data used by the minigui module.
struct DocEntry
  /// Stores the path value associated with doc entry.
  path,
  /// Stores the document value associated with doc entry.
  document,
end struct

/// Represents the window entry data used by the minigui module.
struct WindowEntry
  /// Stores the path value associated with window entry.
  path,
  /// Stores the window value associated with window entry.
  window,
end struct

/// Represents the component entry data used by the minigui module.
struct ComponentEntry
  /// Stores the name value associated with component entry.
  name,
  /// Stores the definition value associated with component entry.
  definition,
  /// Stores the path value associated with component entry.
  path,
end struct

/// Represents the event entry data used by the minigui module.
struct EventEntry
  /// Stores the id value associated with event entry.
  id,
  /// Stores the control type value associated with event entry.
  controlType,
  /// Stores the event name value associated with event entry.
  eventName,
  /// Stores the handler value associated with event entry.
  handler,
  /// Stores the path value associated with event entry.
  path,
end struct

/// Performs the jNull operation for the minigui module.
function jNull()
  return JsonValue("null", "", 0, false, [], [], [])
end function

/// Performs the jString operation for the minigui module.
/// @param v v value consumed by this operation.
function jString(v)
  return JsonValue("string", v, 0, false, [], [], [])
end function

/// Performs the jNumber operation for the minigui module.
/// @param v v value consumed by this operation.
function jNumber(v)
  return JsonValue("number", "", v, false, [], [], [])
end function

/// Performs the jBool operation for the minigui module.
/// @param v v value consumed by this operation.
function jBool(v)
  return JsonValue("bool", "", 0, v, [], [], [])
end function

/// Performs the jObject operation for the minigui module.
/// @param keys keys value consumed by this operation.
/// @param values values value consumed by this operation.
function jObject(keys, values)
  return JsonValue("object", "", 0, false, keys, values, [])
end function

/// Performs the jArray operation for the minigui module.
/// @param items Items consumed or updated by the operation.
function jArray(items)
  return JsonValue("array", "", 0, false, [], [], items)
end function

/// Performs the jsonParseOk operation for the minigui module.
/// @param value Value consumed or transformed by the operation.
function jsonParseOk(value)
  return JsonParseResult(true, value, "")
end function

/// Performs the jsonParseError operation for the minigui module.
/// @param message Human-readable message associated with the operation.
function jsonParseError(message)
  return JsonParseResult(false, jNull(), message)
end function

/// Creates result for the minigui module.
function newResult()
  return Result([], [], [], [], [], [], [], "", jNull(), "")
end function

/// Adds error to the state managed by the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param message Human-readable message associated with the operation.
function addError(result, path, message)
  result.errors = result.errors + [path + ": " + message]
end function

/// Returns whether value is available.
/// @param v v value consumed by this operation.
function hasValue(v)
  return typeof(v) == "struct" and v is JsonValue
end function

/// Performs the prop operation for the minigui module.
/// @param obj obj value consumed by this operation.
/// @param name Name of the affected item.
function prop(obj, name)
  if hasValue(obj) == false then return jNull() end if
  if obj.kind != "object" then return jNull() end if
  if len(obj.keys) == 0 then return jNull() end if
  for i = 0 to len(obj.keys) - 1
    if obj.keys[i] == name then return obj.values[i] end if
  end for
  return jNull()
end function

/// Returns whether prop is available.
/// @param obj obj value consumed by this operation.
/// @param name Name of the affected item.
function hasProp(obj, name)
  if hasValue(obj) == false then return false end if
  if obj.kind != "object" then return false end if
  if len(obj.keys) == 0 then return false end if
  for i = 0 to len(obj.keys) - 1
    if obj.keys[i] == name then return true end if
  end for
  return false
end function

/// Performs the asString operation for the minigui module.
/// @param v v value consumed by this operation.
/// @param fallback Value returned when no explicit result is available.
function asString(v, fallback)
  if hasValue(v) and v.kind == "string" then return v.text end if
  return fallback
end function

/// Performs the asInt operation for the minigui module.
/// @param v v value consumed by this operation.
/// @param fallback Value returned when no explicit result is available.
function asInt(v, fallback)
  if hasValue(v) and v.kind == "number" then return v.number end if
  return fallback
end function

/// Performs the intPart operation for the minigui module.
/// @param value Value consumed or transformed by the operation.
function intPart(value)
  text = "" + value
  output = sb.StringBuilder.withCapacity(len(text))
  if len(text) > 0 then
    for i = 0 to len(text) - 1
      ch = text[i]
      if ch == "." then break end if
      output.appendString(ch)
    end for
  end if
  outv = output.toString()
  if outv == "" or outv == "-" then outv = "0" end if
  n = toNumber(outv)
  if typeof(n) == "int" then return n end if
  return 0
end function

/// Performs the asBool operation for the minigui module.
/// @param v v value consumed by this operation.
/// @param fallback Value returned when no explicit result is available.
function asBool(v, fallback)
  if hasValue(v) and v.kind == "bool" then return v.flag end if
  return fallback
end function

/// Returns whether null satisfies the required condition.
/// @param v v value consumed by this operation.
function isNull(v)
  if hasValue(v) == false then return true end if
  return v.kind == "null"
end function

/// Performs the arrItems operation for the minigui module.
/// @param v v value consumed by this operation.
function arrItems(v)
  if hasValue(v) and v.kind == "array" then return v.items end if
  if isNull(v) then return [] end if
  return [v]
end function

/// Performs the charAt operation for the minigui module.
/// @param text Text consumed by the operation.
/// @param i i value consumed by this operation.
function inline charAt(text, i)
  if i < 0 or i >= len(text) then return "" end if
  return text[i]
end function

/// Performs the ord operation for the minigui module.
/// @param ch ch value consumed by this operation.
function inline ord(ch)
  if typeof(ch) != "string" or len(ch) == 0 then return -1 end if
  return bytes(ch)[0]
end function

/// Returns whether digit satisfies the required condition.
/// @param ch ch value consumed by this operation.
function inline isDigit(ch)
  c = ord(ch)
  return c >= 48 and c <= 57
end function

/// Returns whether letter satisfies the required condition.
/// @param ch ch value consumed by this operation.
function inline isLetter(ch)
  c = ord(ch)
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122)
end function

/// Returns whether ident start satisfies the required condition.
/// @param ch ch value consumed by this operation.
function inline isIdentStart(ch)
  return isLetter(ch) or ch == "_"
end function

/// Returns whether ident char satisfies the required condition.
/// @param ch ch value consumed by this operation.
function inline isIdentChar(ch)
  return isLetter(ch) or isDigit(ch) or ch == "_"
end function

/// Returns whether ws satisfies the required condition.
/// @param ch ch value consumed by this operation.
function inline isWs(ch)
  return ch == " " or ch == "\r" or ch == "\n" or ch == "\t"
end function

/// Performs the skipWs operation for the minigui module.
/// @param p p value consumed by this operation.
function skipWs(p)
  while p.pos < len(p.text) and isWs(charAt(p.text, p.pos))
    p.pos = p.pos + 1
  end while
end function

/// Performs the parserError operation for the minigui module.
/// @param p p value consumed by this operation.
/// @param message Human-readable message associated with the operation.
function parserError(p, message)
  // Keep the first failure. Later parser branches often discover consequences
  // of the same malformed token and would otherwise allocate noisy diagnostics.
  if len(p.errors) == 0 then p.errors = [message + " at offset " + p.pos] end if
end function

/// Performs the hexVal operation for the minigui module.
/// @param ch ch value consumed by this operation.
function hexVal(ch)
  c = ord(ch)
  if c >= 48 and c <= 57 then return c - 48 end if
  if c >= 97 and c <= 102 then return 10 + c - 97 end if
  if c >= 65 and c <= 70 then return 10 + c - 65 end if
  return -1
end function

/// Encodes one Unicode scalar value as a UTF-8 string.
/// @param cp Unicode scalar value to encode.
function codePointUtf8(cp)
  if cp < 0 or cp > 1114111 then return end if
  if cp >= 55296 and cp <= 57343 then return end if
  if cp < 128 then return decode(bytes([cp])) end if
  if cp < 2048 then return decode(bytes([192 | (cp >> 6), 128 | (cp & 63)])) end if
  if cp < 65536 then return decode(bytes([224 | (cp >> 12), 128 | ((cp >> 6) & 63), 128 | (cp & 63)])) end if
  return decode(bytes([240 | (cp >> 18), 128 | ((cp >> 12) & 63), 128 | ((cp >> 6) & 63), 128 | (cp & 63)]))
end function

/// Parses json string for the minigui workflow.
/// @param p p value consumed by this operation.
function parseJsonString(p)
  if charAt(p.text, p.pos) != "\"" then
    parserError(p, "Expected string")
    return ""
  end if
  p.pos = p.pos + 1
  output = sb.StringBuilder.new()
  while p.pos < len(p.text)
    ch = charAt(p.text, p.pos)
    if ch == "\"" then
      p.pos = p.pos + 1
      return output.toString()
    end if
    if ch == "\\" then
      p.pos = p.pos + 1
      esc = charAt(p.text, p.pos)
      if esc == "\"" then output.appendString("\"")
      else if esc == "\\" then output.appendString("\\")
      else if esc == "/" then output.appendString("/")
      else if esc == "b" then output.appendString(decode(bytes([8])))
      else if esc == "f" then output.appendString(decode(bytes([12])))
      else if esc == "n" then output.appendString("\n")
      else if esc == "r" then output.appendString("\r")
      else if esc == "t" then output.appendString("\t")
      else if esc == "u" then
        if p.pos + 4 >= len(p.text) then
          parserError(p, "Invalid unicode escape")
          return ""
        end if
        h1 = hexVal(charAt(p.text, p.pos + 1))
        h2 = hexVal(charAt(p.text, p.pos + 2))
        h3 = hexVal(charAt(p.text, p.pos + 3))
        h4 = hexVal(charAt(p.text, p.pos + 4))
        if h1 < 0 or h2 < 0 or h3 < 0 or h4 < 0 then
          parserError(p, "Invalid unicode escape")
          return ""
        end if
        cp = (h1 << 12) | (h2 << 8) | (h3 << 4) | h4
        p.pos = p.pos + 4
        if cp >= 55296 and cp <= 56319 then
          // JSON represents non-BMP code points as one high/low surrogate pair.
          if charAt(p.text, p.pos + 1) != "\\" or charAt(p.text, p.pos + 2) != "u" or p.pos + 6 >= len(p.text) then
            parserError(p, "High surrogate must be followed by a low surrogate")
            return ""
          end if
          l1 = hexVal(charAt(p.text, p.pos + 3))
          l2 = hexVal(charAt(p.text, p.pos + 4))
          l3 = hexVal(charAt(p.text, p.pos + 5))
          l4 = hexVal(charAt(p.text, p.pos + 6))
          if l1 < 0 or l2 < 0 or l3 < 0 or l4 < 0 then
            parserError(p, "Invalid low surrogate escape")
            return ""
          end if
          low = (l1 << 12) | (l2 << 8) | (l3 << 4) | l4
          if low < 56320 or low > 57343 then
            parserError(p, "High surrogate must be followed by a low surrogate")
            return ""
          end if
          cp = 65536 + ((cp - 55296) << 10) + (low - 56320)
          p.pos = p.pos + 6
        else if cp >= 56320 and cp <= 57343 then
          parserError(p, "Unexpected low surrogate")
          return ""
        end if
        encoded = codePointUtf8(cp)
        if typeof(encoded) != "string" then
          parserError(p, "Invalid Unicode scalar value")
          return ""
        end if
        output.appendString(encoded)
      else
        parserError(p, "Invalid escape")
        return ""
      end if
    else
      if ord(ch) >= 0 and ord(ch) < 32 then
        parserError(p, "Unescaped control character in string")
        return ""
      end if
      output.appendString(ch)
    end if
    p.pos = p.pos + 1
  end while
  parserError(p, "Unterminated string")
  return ""
end function

/// Parses number for the minigui workflow.
/// @param p p value consumed by this operation.
function parseNumber(p)
  start = p.pos
  integerOnly = true
  if charAt(p.text, p.pos) == "-" then p.pos = p.pos + 1 end if
  if charAt(p.text, p.pos) == "0" then
    p.pos = p.pos + 1
    if isDigit(charAt(p.text, p.pos)) then
      parserError(p, "Leading zero in number")
      return 0
    end if
  else
    if isDigit(charAt(p.text, p.pos)) == false then
      parserError(p, "Expected digit")
      return 0
    end if
    while p.pos < len(p.text) and isDigit(charAt(p.text, p.pos))
      p.pos = p.pos + 1
    end while
  end if
  // MSON values are integer-backed, but accepting valid JSON fractions and
  // exponents keeps syntax diagnostics correct before conversion truncates them.
  if p.pos < len(p.text) and charAt(p.text, p.pos) == "." then
    integerOnly = false
    p.pos = p.pos + 1
    if isDigit(charAt(p.text, p.pos)) == false then
      parserError(p, "Expected digit after decimal point")
      return 0
    end if
    while p.pos < len(p.text) and isDigit(charAt(p.text, p.pos))
      p.pos = p.pos + 1
    end while
  end if
  if p.pos < len(p.text) and (charAt(p.text, p.pos) == "e" or charAt(p.text, p.pos) == "E") then
    integerOnly = false
    p.pos = p.pos + 1
    if charAt(p.text, p.pos) == "+" or charAt(p.text, p.pos) == "-" then p.pos = p.pos + 1 end if
    if isDigit(charAt(p.text, p.pos)) == false then
      parserError(p, "Expected digit in exponent")
      return 0
    end if
    while p.pos < len(p.text) and isDigit(charAt(p.text, p.pos))
      p.pos = p.pos + 1
    end while
  end if
  raw = str.substr(p.text, start, p.pos - start)
  if integerOnly == false then
    parserError(p, "MSON supports integer numbers only")
    return 0
  end if
  n = toNumber(raw)
  if typeof(n) != "int" then return 0 end if
  return n
end function

/// Performs the startsAt operation for the minigui module.
/// @param text Text consumed by the operation.
/// @param pos pos value consumed by this operation.
/// @param needle needle value consumed by this operation.
function startsAt(text, pos, needle)
  if pos + len(needle) > len(text) then return false end if
  return str.substr(text, pos, len(needle)) == needle
end function

/// Parses value for the minigui workflow.
/// @param p Parser state consumed by this operation.
/// @param depth Current JSON container nesting depth.
function parseValue(p, depth)
  skipWs(p)
  ch = charAt(p.text, p.pos)
  if ch == "{" or ch == "[" then
    if depth >= MAX_MSON_DEPTH then
      parserError(p, "MSON nesting exceeds limit of " + MAX_MSON_DEPTH)
      return jNull()
    end if
  end if
  if ch == "{" then return parseObject(p, depth + 1) end if
  if ch == "[" then return parseArray(p, depth + 1) end if
  if ch == "\"" then return jString(parseJsonString(p)) end if
  if ch == "t" and startsAt(p.text, p.pos, "true") then
    p.pos = p.pos + 4
    return jBool(true)
  end if
  if ch == "f" and startsAt(p.text, p.pos, "false") then
    p.pos = p.pos + 5
    return jBool(false)
  end if
  if ch == "n" and startsAt(p.text, p.pos, "null") then
    p.pos = p.pos + 4
    return jNull()
  end if
  if ch == "-" or isDigit(ch) then return jNumber(parseNumber(p)) end if
  parserError(p, "Unexpected token")
  return jNull()
end function

/// Parses object for the minigui workflow.
/// @param p Parser state consumed by this operation.
/// @param depth Current JSON container nesting depth.
function parseObject(p, depth)
  keys = list.List.new()
  vals = list.List.new()
  p.pos = p.pos + 1
  skipWs(p)
  if charAt(p.text, p.pos) == "}" then
    p.pos = p.pos + 1
    return jObject(keys.toArray(), vals.toArray())
  end if
  while p.pos < len(p.text)
    skipWs(p)
    key = parseJsonString(p)
    if listContains(keys, key) then
      parserError(p, "Duplicate object key '" + key + "'")
      return jObject(keys.toArray(), vals.toArray())
    end if
    skipWs(p)
    if charAt(p.text, p.pos) != ":" then
      parserError(p, "Expected ':'")
      return jObject(keys.toArray(), vals.toArray())
    end if
    p.pos = p.pos + 1
    val = parseValue(p, depth)
    keys.add(key)
    vals.add(val)
    skipWs(p)
    ch = charAt(p.text, p.pos)
    if ch == "}" then
      p.pos = p.pos + 1
      return jObject(keys.toArray(), vals.toArray())
    end if
    if ch != "," then
      parserError(p, "Expected ',' or '}'")
      return jObject(keys.toArray(), vals.toArray())
    end if
    p.pos = p.pos + 1
  end while
  parserError(p, "Unterminated object")
  return jObject(keys.toArray(), vals.toArray())
end function

/// Parses array for the minigui workflow.
/// @param p Parser state consumed by this operation.
/// @param depth Current JSON container nesting depth.
function parseArray(p, depth)
  items = list.List.new()
  p.pos = p.pos + 1
  skipWs(p)
  if charAt(p.text, p.pos) == "]" then
    p.pos = p.pos + 1
    return jArray(items.toArray())
  end if
  while p.pos < len(p.text)
    items.add(parseValue(p, depth))
    skipWs(p)
    ch = charAt(p.text, p.pos)
    if ch == "]" then
      p.pos = p.pos + 1
      return jArray(items.toArray())
    end if
    if ch != "," then
      parserError(p, "Expected ',' or ']'")
      return jArray(items.toArray())
    end if
    p.pos = p.pos + 1
  end while
  parserError(p, "Unterminated array")
  return jArray(items.toArray())
end function

/// Parses json for the minigui workflow.
/// @param text Text consumed by the operation.
function parseJson(text)
  if typeof(text) != "string" then return jsonParseError("MSON input must be text") end if
  if len(text) > MAX_MSON_BYTES then return jsonParseError("MSON document exceeds size limit of " + MAX_MSON_BYTES + " bytes") end if
  p = Parser(text, 0, [])
  v = parseValue(p, 0)
  skipWs(p)
  if len(p.errors) == 0 and p.pos < len(text) then parserError(p, "Unexpected trailing content") end if
  if len(p.errors) > 0 then return jsonParseError(p.errors[0]) end if
  return jsonParseOk(v)
end function

/// Performs the pathSlash operation for the minigui module.
/// @param p p value consumed by this operation.
function pathSlash(p)
#if TARGET_OS == "linux"
  return str.replaceAll(p, "\\", "/")
#else
  return str.replaceAll(p, "/", "\\")
#endif
end function

/// Performs the pathUnslash operation for the minigui module.
/// @param p p value consumed by this operation.
function pathUnslash(p)
  return str.replaceAll(p, "\\", "/")
end function

/// Performs the trimDotSlash operation for the minigui module.
/// @param p p value consumed by this operation.
function trimDotSlash(p)
#if TARGET_OS == "linux"
  r = pathSlash(p)
  while str.startsWith(r, "./")
    r = str.substr(r, 2, len(r) - 2)
  end while
  return r
#else
  r = pathSlash(p)
  while str.startsWith(r, ".\\")
    r = str.substr(r, 2, len(r) - 2)
  end while
  return r
#endif
end function

/// Returns whether rooted satisfies the required condition.
/// @param p p value consumed by this operation.
function isRooted(p)
#if TARGET_OS == "linux"
  return str.startsWith(pathSlash(p), "/")
#else
  pp = pathSlash(p)
  if len(pp) >= 3 and pp[1] == ":" and pp[2] == "\\" then return true end if
  if str.startsWith(pp, "\\\\") then return true end if
  return false
#endif
end function

/// Performs the dirname operation for the minigui module.
/// @param path Path of the file or directory used by the operation.
function dirname(path)
#if TARGET_OS == "linux"
  pp = pathSlash(path)
  parts = str.split(pp, "/")
  if len(parts) < 2 then return "." end if
  outv = ""
  for i = 0 to len(parts) - 2
    if i > 0 then outv = outv + "/" end if
    outv = outv + parts[i]
  end for
  if outv == "" then return "/" end if
  return outv
#else
  p = pathSlash(path)
  last = -1
  for i = 0 to len(p) - 1
    if p[i] == "\\" then last = i end if
  end for
  if last < 0 then return "." end if
  if last == 0 then return "\\" end if
  return str.substr(p, 0, last)
#endif
end function

/// Performs the basenameNoExt operation for the minigui module.
/// @param path Path of the file or directory used by the operation.
function basenameNoExt(path)
#if TARGET_OS == "linux"
  pp = pathSlash(path)
  parts = str.split(pp, "/")
  name = parts[len(parts)-1]
  dot = -1
  for i = 0 to len(name)-1
    if name[i] == "." then dot = i end if
  end for
  if dot > 0 then return str.substr(name, 0, dot) end if
  return name
#else
  p = pathSlash(path)
  start = 0
  for i = 0 to len(p) - 1
    if p[i] == "\\" then start = i + 1 end if
  end for
  name = str.substr(p, start, len(p) - start)
  if len(name) == 0 then return name end if
  dot = -1
  for j = 0 to len(name) - 1
    if name[j] == "." then dot = j end if
  end for
  if dot >= 0 then return str.substr(name, 0, dot) end if
  return name
#endif
end function

/// Joins path for the minigui workflow.
/// @param a a value consumed by this operation.
/// @param b b value consumed by this operation.
function joinPath(a, b)
#if TARGET_OS == "linux"
  if b == "" then return pathSlash(a) end if
  if isRooted(b) then return pathSlash(b) end if
  if a == "" or a == "." then return pathSlash(b) end if
  return pathSlash(a) + "/" + pathSlash(b)
#else
  if b == "" then return pathSlash(a) end if
  if isRooted(b) then return pathSlash(b) end if
  aa = pathSlash(a)
  if aa == "" or aa == "." then return pathSlash(b) end if
  if str.endsWith(aa, "\\") then return aa + pathSlash(b) end if
  return aa + "\\" + pathSlash(b)
#endif
end function

/// Normalizes path for the minigui workflow.
/// @param p p value consumed by this operation.
function normalizePath(p)
#if TARGET_OS == "linux"
  pp = pathSlash(p)
  absolute = isRooted(pp)
  parts = str.split(pp, "/")
  result = list.List.new()
  for each part in parts
    if part == "" or part == "." then continue end if
    if part == ".." and result.len() > 0 and result.last() != ".." then
      result.pop()
    else if part == ".." and absolute then
      continue
    else
      result.add(part)
    end if
  end for
  joined = str.join(result.toArray(), "/")
  if absolute then return "/" + joined end if
  if joined == "" then return "." end if
  return joined
#else
  pp = pathSlash(p)
  unc = str.startsWith(pp, "\\\\")
  absoluteDrive = len(pp) >= 3 and pp[1] == ":" and pp[2] == "\\"
  parts = str.split(pp, "\\")
  output = list.List.withCapacity(len(parts))
  if len(parts) > 0 then
    for i = 0 to len(parts) - 1
      part = parts[i]
      if part == "" or part == "." then continue end if
      if part == ".." and output.len() > 0 and output.last() != ".." then
        output.pop()
      else if part == ".." and (unc or absoluteDrive) then
        // Absolute paths cannot traverse above their volume/share root.
        continue
      else
        output.add(part)
      end if
    end for
  end if
  if output.len() == 0 then return "." end if
  joined = str.join(output.toArray(), "\\")
  if unc then return "\\\\" + joined end if
  return joined
#endif
end function

/// Splits path parts for the minigui workflow.
/// @param p p value consumed by this operation.
function splitPathParts(p)
#if TARGET_OS == "linux"
  return str.split(normalizePath(p), "/")
#else
  pp = trimDotSlash(normalizePath(p))
  if pp == "." then return [] end if
  return str.split(pp, "\\")
#endif
end function

/// Performs the relativePath operation for the minigui module.
/// @param fromDir fromDir value consumed by this operation.
/// @param toPath Path associated with to.
function relativePath(fromDir, toPath)
  fromParts = splitPathParts(fromDir)
  toParts = splitPathParts(toPath)
  i = 0
  while i < len(fromParts) and i < len(toParts) and fromParts[i] == toParts[i]
    i = i + 1
  end while
  output = list.List.withCapacity((len(fromParts) - i) + (len(toParts) - i))
  if i < len(fromParts) then
    for j = i to len(fromParts) - 1
      output.add("..")
    end for
  end if
  if i < len(toParts) then
    for k = i to len(toParts) - 1
      output.add(toParts[k])
    end for
  end if
  if output.len() == 0 then return "." end if
  return pathUnslash(str.join(output.toArray(), "\\"))
end function

/// Ensures dir is available to the minigui workflow.
/// @param path Path of the file or directory used by the operation.
function ensureDir(path)
#if TARGET_OS == "linux"
  p = normalizePath(path)
  if fs.isDir(p) then return end if
  parent = dirname(p)
  if parent != p then ensureDir(parent) end if
  _mkdir(p, 493)
#else
  p = normalizePath(path)
  if p == "." then return end if
  parts = str.split(p, "\\")
  cur = ""
  if len(parts) > 0 then
    for i = 0 to len(parts) - 1
      part = parts[i]
      if part == "" then continue end if
      if cur == "" then cur = part else cur = cur + "\\" + part end if
      _wmkdir(cur)
    end for
  end if
#endif
end function

/// Quotes one argument according to the Windows CRT command-line rules.
/// CreateProcessW receives a command-line string, so quotes and the
/// backslashes preceding them must be encoded exactly.
/// @param value Argument value to quote.
function quoteProcessArgument(value)
  if typeof(value) != "string" then return "\"\"" end if
  output = sb.StringBuilder.withCapacity(len(value) + 8)
  output.appendString("\"")
  pendingSlashes = 0
  raw = bytes(value)
  if len(raw) > 0 then
    for i = 0 to len(raw) - 1
      ch = raw[i]
      if ch == 92 then
        pendingSlashes = pendingSlashes + 1
        continue
      end if
      copies = pendingSlashes
      if ch == 34 then copies = (pendingSlashes * 2) + 1 end if
      while copies > 0
        output.appendString("\\")
        copies = copies - 1
      end while
      pendingSlashes = 0
      output.appendSlice(value, i, 1)
    end for
  end if
  pendingSlashes = pendingSlashes * 2
  while pendingSlashes > 0
    output.appendString("\\")
    pendingSlashes = pendingSlashes - 1
  end while
  output.appendString("\"")
  return output.toString()
end function

/// Reads an unsigned little-endian 32-bit value.
/// @param data Byte buffer to inspect.
/// @param offset Zero-based byte offset.
function inline readU32(data, offset)
  return data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24)
end function

/// Reads a native 64-bit handle from a PROCESS_INFORMATION buffer.
/// @param data Byte buffer to inspect.
/// @param offset Zero-based byte offset.
function inline readHandle(data, offset)
  value = 0
  for i = 0 to 7
    value = value | (data[offset + i] << (i * 8))
  end for
  return value
end function

/// Runs a child process directly and returns its exit code.
/// @param executable Executable passed to CreateProcessW.
/// @param args Exact argv values supplied to the child process.
function runProcess(executable, args)
#if TARGET_OS == "linux"
  values = [executable] + args
  storage = []
  argv = bytes((len(values) + 1) * 8, 0)
  for i = 0 to len(values) - 1
    data = bytes(values[i]) + bytes(1, 0)
    storage = storage + [data]
    pointer = nativeBytesPtr(data)
    for byteIndex = 0 to 7
      argv[i * 8 + byteIndex] = (pointer >> (byteIndex * 8)) & 255
    end for
  end for
  pid = _fork()
  if pid < 0 then return -1 end if
  if pid == 0 then
    _execvp(executable, argv)
    _exit(127)
  end if
  status = bytes(4, 0)
  if _waitpid(pid, status, 0) < 0 then return -1 end if
  code = readU32(status, 0)
  if (code & 127) != 0 then return 128 + (code & 127) end if
  return (code >> 8) & 255
#else
  command = sb.StringBuilder.new()
  command.appendString(quoteProcessArgument(executable))
  if len(args) > 0 then
    for i = 0 to len(args) - 1
      command.appendString(" ")
      command.appendString(quoteProcessArgument(args[i]))
    end for
  end if
  startup = bytes(104, 0)
  startup[0] = 104
  processInfo = bytes(24, 0)
  if _CreateProcessW(executable, command.toString(), 0, 0, false, 0, 0, 0, startup, processInfo) == false then return -1 end if
  processHandle = readHandle(processInfo, 0)
  threadHandle = readHandle(processInfo, 8)
  if threadHandle != 0 then _CloseHandle(threadHandle) end if
  if processHandle == 0 then return -1 end if
  waited = _WaitForSingleObject(processHandle, INFINITE)
  exitCode = bytes(4, 0)
  gotExitCode = _GetExitCodeProcess(processHandle, exitCode)
  _CloseHandle(processHandle)
  if waited != 0 or gotExitCode == false then return -1 end if
  return readU32(exitCode, 0)
#endif
end function

/// Resolves a named executable without invoking a command shell.
/// @param name Executable name, including its extension.
function resolveExecutable(name)
#if TARGET_OS == "linux"
  if isRooted(name) then
    if fs.isFile(name) then return name end if
    return ""
  end if
  envPath = process.environment("PATH")
  if typeof(envPath) != "string" then return "" end if
  for each entry in str.split(envPath, ":")
    candidate = joinPath(entry, name)
    if fs.isFile(candidate) then return candidate end if
  end for
  return ""
#else
  output = bytes(MAX_WINDOWS_PATH_CHARS * 2, 0)
  count = _SearchPathW(0, name, 0, MAX_WINDOWS_PATH_CHARS, output, 0)
  if count == 0 or count >= MAX_WINDOWS_PATH_CHARS then return "" end if
  resolved = decode16Z(output)
  if typeof(resolved) != "string" then return "" end if
  return resolved
#endif
end function

/// Resolves the preferred Python interpreter for the Python MiniLang compiler.
function resolvePythonInterpreter()
#if TARGET_OS == "linux"
  return resolveExecutable("python3")
#else
  localAppData = process.environment("LOCALAPPDATA")
  if typeof(localAppData) == "string" then
    preferred = joinPath(localAppData, "Programs\\Python\\Python314\\python.exe")
    if fs.isFile(preferred) then return preferred end if
  end if
  programFiles = process.environment("ProgramFiles")
  if typeof(programFiles) == "string" then
    preferredSystem = joinPath(programFiles, "Python314\\python.exe")
    if fs.isFile(preferredSystem) then return preferredSystem end if
  end if
  return resolveExecutable("python.exe")
#endif
end function

/// Returns whether the supplied data contains contains.
/// @param arr arr value consumed by this operation.
/// @param value Value consumed or transformed by the operation.
function contains(arr, value)
  if len(arr) == 0 then return false end if
  for i = 0 to len(arr) - 1
    if arr[i] == value then return true end if
  end for
  return false
end function

/// Returns whether a growable list contains the supplied value.
/// @param values Growable list to inspect.
/// @param value Value to find.
function listContains(values, value)
  if values is void or values.len() == 0 then return false end if
  for i = 0 to values.len() - 1
    if values.get(i) == value then return true end if
  end for
  return false
end function

/// Performs the identOk operation for the minigui module.
/// @param value Value consumed or transformed by the operation.
function identOk(value)
  if typeof(value) != "string" or len(value) == 0 then return false end if
  first = value[0]
  if isIdentStart(first) == false then return false end if
  if len(value) == 1 then return true end if
  for i = 1 to len(value) - 1
    if isIdentChar(value[i]) == false then return false end if
  end for
  if contains(["print", "if", "then", "else", "end", "while", "loop", "true", "false", "and", "or", "not", "function", "return", "global", "const", "for", "to", "each", "in", "break", "continue", "switch", "case", "default", "struct", "enum", "are", "namespace", "import", "as", "package", "extern", "from", "returns", "symbol", "out", "static", "inline", "synchronized", "void", "is", "defer", "interface", "implements", "iterator", "yield", "async", "await"], value) then return false end if
  return true
end function

/// Performs the miniIdent operation for the minigui module.
/// @param value Value consumed or transformed by the operation.
function miniIdent(value)
  if typeof(value) != "string" then return "_" end if
  if len(value) == 0 then return "_" end if
  output = sb.StringBuilder.withCapacity(len(value) + 1)
  for i = 0 to len(value) - 1
    ch = value[i]
    if isIdentChar(ch) then
      output.appendString(ch)
    else
      output.appendString("_")
    end if
  end for
  outv = output.toString()
  if outv == "" then outv = "_" end if
  first = outv[0]
  if isIdentStart(first) then return outv end if
  return "_" + outv
end function

/// Performs the upperFirst operation for the minigui module.
/// @param s0 s0 value consumed by this operation.
function upperFirst(s0)
  if s0 == "" then return "" end if
  ch = s0[0]
  c = ord(ch)
  if c >= 97 and c <= 122 then
    b = bytes(ch)
    b[0] = b[0] - 32
    ch = decode(b)
  end if
  if len(s0) == 1 then return ch end if
  return ch + str.substr(s0, 1, len(s0) - 1)
end function

/// Performs the miniGuiTypeName operation for the minigui module.
/// @param ns ns value consumed by this operation.
function miniGuiTypeName(ns)
  parts = str.split(ns, ".")
  output = sb.StringBuilder.withCapacity(len(ns))
  for i = 0 to len(parts) - 1
    p = miniIdent(parts[i])
    if p == "_" then continue end if
    output.appendString(upperFirst(p))
  end for
  outv = output.toString()
  if outv == "" then outv = "MiniGuiApp" end if
  return miniIdent(outv)
end function

/// Performs the mlString operation for the minigui module.
/// @param value Value consumed or transformed by the operation.
function mlString(value)
  if typeof(value) != "string" then value = "" end if
  if len(value) == 0 then return "\"\"" end if
  output = sb.StringBuilder.withCapacity(len(value) + 8)
  output.appendString("\"")
  for i = 0 to len(value) - 1
    ch = value[i]
    if ch == "\\" then output.appendString("\\\\")
    else if ch == "\"" then output.appendString("\\\"")
    else if ch == "\n" then output.appendString("\\n")
    else if ch == "\r" then output.appendString("\\r")
    else if ch == "\t" then output.appendString("\\t")
    else output.appendString(ch)
    end if
  end for
  output.appendString("\"")
  return output.toString()
end function

/// Performs the jsonScalarToString operation for the minigui module.
/// @param v v value consumed by this operation.
function jsonScalarToString(v)
  if v.kind == "string" then return v.text end if
  if v.kind == "number" then return "" + v.number end if
  if v.kind == "bool" then
    if v.flag then return "true" end if
    return "false"
  end if
  return ""
end function

/// Performs the resourceValue operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param value Value consumed or transformed by the operation.
function resourceValue(result, path, value)
  if hasValue(value) and value.kind == "object" and hasProp(value, "$resource") then
    name = asString(prop(value, "$resource"), "")
    if len(result.resources) == 0 then
      addError(result, path, "Unknown resource '" + name + "'.")
      return jNull()
    end if
    for i = 0 to len(result.resources) - 1
      pair = result.resources[i]
      if pair[0] == name then return pair[1] end if
    end for
    addError(result, path, "Unknown resource '" + name + "'.")
    return jNull()
  end if
  return value
end function

/// Reads mson for the minigui workflow.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
function readMson(result, path)
  t = fs.readAllText(path)
  if typeof(t) == "error" then
    addError(result, path, "JSON syntax error: " + t.message)
    return jNull()
  end if
  parsed = parseJson(t)
  if parsed.ok == false then
    addError(result, path, "JSON syntax error: " + parsed.message)
    return jNull()
  end if
  return parsed.value
end function

/// Resolves mson path for the minigui workflow.
/// @param importPath Path associated with import.
/// @param baseDir baseDir value consumed by this operation.
/// @param includeDirs includeDirs value consumed by this operation.
function resolveMsonPath(importPath, baseDir, includeDirs)
  cand = ""
  if isRooted(importPath) then
    cand = normalizePath(importPath)
    if fs.isFile(cand) then return cand end if
  else
    cand = normalizePath(joinPath(baseDir, importPath))
    if fs.isFile(cand) then return cand end if
    if len(includeDirs) > 0 then
      for i = 0 to len(includeDirs) - 1
        cand = normalizePath(joinPath(includeDirs[i], importPath))
        if fs.isFile(cand) then return cand end if
      end for
    end if
  end if
  return ""
end function

/// Performs the stackHas operation for the minigui module.
/// @param stack stack value consumed by this operation.
/// @param path Path of the file or directory used by the operation.
function stackHas(stack, path)
  if len(stack) == 0 then return false end if
  for i = 0 to len(stack) - 1
    #if TARGET_OS == "windows"
    if str.equalsIgnoreCaseAscii(stack[i], path) then return true end if
#else
    if stack[i] == path then return true end if
#endif
  end for
  return false
end function

/// Returns whether a normalized MSON path has already been loaded.
/// @param result Result object whose document graph is inspected.
/// @param path Normalized path to find.
function documentLoaded(result, path)
  if len(result.documents) == 0 then return false end if
  for i = 0 to len(result.documents) - 1
    #if TARGET_OS == "windows"
    if str.equalsIgnoreCaseAscii(result.documents[i].path, path) then return true end if
#else
    if result.documents[i].path == path then return true end if
#endif
  end for
  return false
end function

/// Performs the componentByName operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param name Name of the affected item.
function componentByName(result, name)
  if len(result.components) == 0 then return void end if
  for i = 0 to len(result.components) - 1
    if result.components[i].name == name then return result.components[i] end if
  end for
  return void
end function

/// Loads graph for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param includeDirs includeDirs value consumed by this operation.
/// @param stack stack value consumed by this operation.
function loadGraph(result, path, includeDirs, stack)
  full = normalizePath(path)
  if stackHas(stack, full) then
    addError(result, path, "Cyclic MSON import: " + str.join(stack + [full], " -> "))
    return
  end if
  // A diamond-shaped import graph must contribute each file only once.
  if documentLoaded(result, full) then return end if
  if len(result.documents) >= MAX_MSON_DOCUMENTS then
    addError(result, path, "MSON import graph exceeds limit of " + MAX_MSON_DOCUMENTS + " documents.")
    return
  end if
  doc = readMson(result, full)
  if isNull(doc) then return end if
  result.documents = result.documents + [DocEntry(full, doc)]
  nextStack = stack + [full]
  base = dirname(full)
  imports = arrItems(prop(doc, "imports"))
  if len(imports) > 0 then
    for i = 0 to len(imports) - 1
      imp = asString(imports[i], "")
      resolved = resolveMsonPath(imp, base, includeDirs)
      if resolved == "" then addError(result, full, "Import not found: " + imp)
      else loadGraph(result, resolved, includeDirs, nextStack)
      end if
    end for
  end if
  resources = prop(doc, "resources")
  if resources.kind == "object" and len(resources.keys) > 0 then
    for r = 0 to len(resources.keys) - 1
      resourceName = resources.keys[r]
      duplicateResource = false
      if len(result.resources) > 0 then
        for existingResource = 0 to len(result.resources) - 1
          if result.resources[existingResource][0] == resourceName then duplicateResource = true end if
        end for
      end if
      if duplicateResource then addError(result, full, "Duplicate resource '" + resourceName + "'.")
      else result.resources = result.resources + [[resourceName, resources.values[r]]]
      end if
    end for
  end if
  comps = arrItems(prop(doc, "components"))
  if len(comps) > 0 then
    for c = 0 to len(comps) - 1
      name = asString(prop(comps[c], "name"), "")
      if name == "" then addError(result, full, "Component is missing required property 'name'.")
      else if componentByName(result, name) is void == false then addError(result, full, "Duplicate component '" + name + "'.")
      else result.components = result.components + [ComponentEntry(name, comps[c], full)]
      end if
    end for
  end if
  wins = arrItems(prop(doc, "windows"))
  if len(wins) > 0 then
    for w = 0 to len(wins) - 1
      result.windows = result.windows + [WindowEntry(full, wins[w])]
    end for
  end if
end function

/// Performs the cloneJson operation for the minigui module.
/// @param v v value consumed by this operation.
function cloneJson(v)
  if v.kind == "object" then
    vals = array(len(v.values))
    if len(v.values) > 0 then
      for i = 0 to len(v.values) - 1
        vals[i] = cloneJson(v.values[i])
      end for
    end if
    return jObject(v.keys, vals)
  end if
  if v.kind == "array" then
    items = array(len(v.items))
    if len(v.items) > 0 then
      for j = 0 to len(v.items) - 1
        items[j] = cloneJson(v.items[j])
      end for
    end if
    return jArray(items)
  end if
  return JsonValue(v.kind, v.text, v.number, v.flag, v.keys, v.values, v.items)
end function

/// Updates prop maintained by the minigui module.
/// @param obj obj value consumed by this operation.
/// @param name Name of the affected item.
/// @param value Value consumed or transformed by the operation.
function setProp(obj, name, value)
  if obj.kind != "object" then return obj end if
  if len(obj.keys) > 0 then
    for i = 0 to len(obj.keys) - 1
      if obj.keys[i] == name then
        obj.values[i] = value
        return obj
      end if
    end for
  end if
  obj.keys = obj.keys + [name]
  obj.values = obj.values + [value]
  return obj
end function

/// Performs the copyNodeWithPrefix operation for the minigui module.
/// @param node node value consumed by this operation.
/// @param prefix prefix value consumed by this operation.
function copyNodeWithPrefix(node, prefix)
  copy = cloneJson(node)
  id = asString(prop(copy, "id"), "")
  if id != "" then copy = setProp(copy, "id", jString(prefix + "_" + id)) end if
  children = arrItems(prop(copy, "children"))
  if len(children) > 0 then
    outv = array(len(children))
    for i = 0 to len(children) - 1
      outv[i] = copyNodeWithPrefix(children[i], prefix)
    end for
    copy = setProp(copy, "children", jArray(outv))
  end if
  return copy
end function

/// Performs the expandComponents operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
function expandComponents(result, path, node)
  typ = asString(prop(node, "type"), "")
  comp = componentByName(result, typ)
  if comp is void == false then
    instanceId = asString(prop(node, "id"), "")
    if instanceId == "" then
      addError(result, path, "Component '" + typ + "' usage requires an id.")
      return node
    end if
    content = prop(comp.definition, "content")
    if isNull(content) then
      addError(result, path, "Component '" + typ + "' has no content.")
      return node
    end if
    copy = copyNodeWithPrefix(content, miniIdent(instanceId))
    copy = setProp(copy, "id", jString(instanceId))
    return copy
  end if
  children = arrItems(prop(node, "children"))
  if len(children) > 0 then
    outv = array(len(children))
    for i = 0 to len(children) - 1
      outv[i] = expandComponents(result, path, children[i])
    end for
    node = setProp(node, "children", jArray(outv))
  end if
  return node
end function

/// Performs the testPropertyNames operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param obj obj value consumed by this operation.
/// @param allowed allowed value consumed by this operation.
/// @param context Context that carries state for the operation.
function testPropertyNames(result, path, obj, allowed, context)
  if isNull(obj) then return end if
  if obj.kind != "object" then return end if
  if len(obj.keys) == 0 then return end if
  for i = 0 to len(obj.keys) - 1
    if contains(allowed, obj.keys[i]) == false then
      addError(result, path, "Unknown property '" + obj.keys[i] + "' in " + context + ".")
    end if
  end for
end function

/// Performs the allowedControlEvents operation for the minigui module.
/// @param typ typ value consumed by this operation.
function allowedControlEvents(typ)
  if typ == "TrayIcon" then return ["click", "clicked"] end if
  if typ == "RichTextBox" or typ == "CodeEditor" then return ["textChanged", "changed", "change", "focus", "blur"] end if
  if typ == "PropertyGrid" then return ["selectionChanged", "valueChanged", "changed", "change"] end if
  commonEvents = ["focus", "blur"]
  if contains(["Button", "CheckBox", "RadioButton", "ToggleSwitch", "ToolBar", "MenuBar", "ContextMenu", "LinkLabel", "Image", "FilePicker", "FolderPicker", "ColorPicker"], typ) then return ["click", "clicked"] + commonEvents end if
  if contains(["TextBox", "SearchBox", "TextArea", "PasswordBox", "DatePicker", "DateTimePicker", "TimePicker", "Calendar"], typ) then return ["textChanged", "changed", "change", "submit", "validating", "validated"] + commonEvents end if
  if typ == "NumberBox" or typ == "SpinBox" then return ["textChanged", "valueChanged", "changed", "change", "submit", "validating", "validated"] + commonEvents end if
  if contains(["ComboBox", "EditableComboBox", "ListBox", "TabControl", "TreeView", "ListView", "Table", "DataGrid"], typ) then return ["selectionChanged", "selected", "valueChanged", "changed", "change"] + commonEvents end if
  if contains(["ScrollBar", "Slider", "ProgressBar", "ScrollViewer"], typ) then return ["scrollChanged", "valueChanged", "changed", "change"] + commonEvents end if
  if typ == "Splitter" then return ["valueChanged", "changed", "change"] + commonEvents end if
  return commonEvents
end function

/// Performs the commonControlProps operation for the minigui module.
function commonControlProps()
  return ["text", "width", "height", "x", "y", "visible", "enabled", "margin", "horizontalAlignment", "verticalAlignment", "alignment", "dock", "fill", "resizeMode", "anchor", "minWidth", "minHeight", "maxWidth", "maxHeight", "tooltip", "tabIndex", "row", "column", "rowSpan", "columnSpan", "fontFamily", "fontSize", "fontWeight", "foreground", "background", "borderColor", "borderWidth"]
end function

/// Performs the allowedControlProps operation for the minigui module.
/// @param typ typ value consumed by this operation.
function allowedControlProps(typ)
  if typ == "RichTextBox" or typ == "CodeEditor" then return commonControlProps() + ["language", "readOnly", "maxLength"] end if
  if typ == "PropertyGrid" then return commonControlProps() + ["items"] end if
  if typ == "TrayIcon" then return commonControlProps() + ["items", "source"] end if
  if typ == "WebView" then return commonControlProps() + ["url", "html"] end if
  if typ == "DrawingCanvas" then return commonControlProps() end if
  if typ == "Chart" then return commonControlProps() + ["values", "chartType", "color"] end if
  if contains(["TextBox", "SearchBox", "TextArea", "PasswordBox"], typ) then return commonControlProps() + ["placeholder", "readOnly", "maxLength", "inputType", "validationMessage"] end if
  if typ == "NumberBox" or typ == "SpinBox" then return commonControlProps() + ["placeholder", "readOnly", "maxLength", "minimum", "maximum", "value", "step", "decimals", "validationMessage"] end if
  if contains(["CheckBox", "RadioButton", "ToggleSwitch"], typ) then return commonControlProps() + ["checked"] end if
  if contains(["ComboBox", "EditableComboBox", "ListBox", "TabControl", "TreeView"], typ) then return commonControlProps() + ["items", "selectedIndex"] end if
  if contains(["ListView", "Table", "DataGrid"], typ) then return commonControlProps() + ["items", "selectedIndex", "columns", "columnWidths", "editable"] end if
  if contains(["ScrollBar", "Slider"], typ) then return commonControlProps() + ["orientation", "minimum", "maximum", "value", "smallStep", "largeStep"] end if
  if typ == "ProgressBar" then return commonControlProps() + ["minimum", "maximum", "value"] end if
  if contains(["MenuBar", "ToolBar", "ContextMenu"], typ) then return commonControlProps() + ["items"] end if
  if typ == "Image" then return commonControlProps() + ["source", "stretch"] end if
  if typ == "Separator" then return commonControlProps() + ["orientation"] end if
  if typ == "Splitter" then return commonControlProps() + ["orientation", "targetBefore", "targetAfter"] end if
  if typ == "FilePicker" then return commonControlProps() + ["title", "filter"] end if
  if typ == "FolderPicker" then return commonControlProps() + ["title"] end if
  if typ == "ColorPicker" then return commonControlProps() + ["title", "value"] end if
  if typ == "LinkLabel" then return commonControlProps() + ["url", "visited"] end if
  if typ == "ScrollViewer" then return commonControlProps() + ["padding", "spacing", "horizontalScroll", "verticalScroll", "autoHide", "scrollX", "scrollY"] end if
  if contains(["Button", "Label", "Panel", "GroupBox", "StatusBar", "DatePicker", "DateTimePicker", "TimePicker", "Calendar"], typ) then return commonControlProps() + ["padding", "spacing"] end if
  return []
end function

/// Returns whether control satisfies the required condition.
/// @param typ typ value consumed by this operation.
function isControl(typ)
  if contains(["RichTextBox", "CodeEditor", "PropertyGrid", "TrayIcon", "WebView", "DrawingCanvas", "Chart"], typ) then return true end if
  return contains(["Label", "Button", "FilePicker", "FolderPicker", "ColorPicker", "TextBox", "SearchBox", "TextArea", "PasswordBox", "NumberBox", "SpinBox", "CheckBox", "ToggleSwitch", "RadioButton", "Image", "Separator", "Splitter", "LinkLabel", "Panel", "ScrollViewer", "GroupBox", "ComboBox", "EditableComboBox", "ListBox", "ScrollBar", "Slider", "ProgressBar", "TabControl", "MenuBar", "ContextMenu", "StatusBar", "ToolBar", "TreeView", "ListView", "Table", "DataGrid", "DatePicker", "DateTimePicker", "TimePicker", "Calendar"], typ)
end function

/// Returns whether container control satisfies the required condition.
/// @param typ typ value consumed by this operation.
function isContainerControl(typ)
  return contains(["Panel", "GroupBox", "TabControl", "ScrollViewer"], typ)
end function

/// Returns whether layout satisfies the required condition.
/// @param typ typ value consumed by this operation.
function isLayout(typ)
  return contains(["VerticalStack", "HorizontalStack", "Grid", "Canvas", "DockPanel", "WrapPanel"], typ)
end function

/// Performs the testControlProperties operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param typ typ value consumed by this operation.
/// @param properties properties value consumed by this operation.
function testControlProperties(result, path, typ, properties)
  if isNull(properties) then return end if
  testPropertyNames(result, path, properties, allowedControlProps(typ), typ + ".properties")
  if len(properties.keys) == 0 then return end if
  for i = 0 to len(properties.keys) - 1
    name = properties.keys[i]
    v = resourceValue(result, path, properties.values[i])
    if contains(["language", "html", "chartType", "color"], name) and v.kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be a string.") end if
    if name == "chartType" and v.kind == "string" and v.text != "bar" and v.text != "line" then addError(result, path, "chartType must be 'bar' or 'line'.") end if
    if name == "language" and v.kind == "string" and contains(["", "minilang", "python", "json", "c", "cpp"], v.text) == false then addError(result, path, "Unsupported editor language: " + v.text) end if
    if name == "values" then
      if v.kind != "array" then
        addError(result, path, "Chart values must be an array of nonnegative integers.")
      else
        for each entry in v.items
          if entry.kind != "number" then addError(result, path, "Chart values must be integers.")
          else if entry.number < 0 then addError(result, path, "Chart values must be nonnegative.")
          end if
        end for
      end if
    end if
    if contains(["x", "y", "selectedIndex", "tabIndex", "row", "column", "rowSpan", "columnSpan"], name) and v.kind != "number" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer.") end if
    if contains(["width", "height"], name) then
      if v.kind != "number" and v.kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer, 'auto' or 'fill'.") end if
      if v.kind == "string" and v.text != "auto" and v.text != "fill" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer, 'auto' or 'fill'.") end if
    end if
    if contains(["minimum", "maximum", "value", "smallStep", "largeStep", "step", "decimals", "padding", "spacing", "minWidth", "minHeight", "maxWidth", "maxHeight", "fontSize", "borderWidth", "scrollX", "scrollY"], name) and (typ != "ColorPicker" or name != "value") and v.kind != "number" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer.") end if
    if contains(["visible", "enabled", "fill", "readOnly", "visited", "horizontalScroll", "verticalScroll", "autoHide", "editable"], name) and v.kind != "bool" then addError(result, path, "Property '" + name + "' on " + typ + " must be a boolean.") end if
    if name == "checked" and v.kind != "bool" then addError(result, path, "Property '" + name + "' on " + typ + " must be a boolean.") end if
    if contains(["text", "placeholder", "orientation", "horizontalAlignment", "verticalAlignment", "alignment", "dock", "resizeMode", "anchor", "tooltip", "fontFamily", "fontWeight", "foreground", "background", "borderColor", "inputType", "validationMessage", "source", "stretch", "url", "title", "filter", "targetBefore", "targetAfter"], name) and v.kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be a string.") end if
    if typ == "ColorPicker" and name == "value" and v.kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be a string.") end if
    if name == "orientation" and v.kind == "string" and v.text != "vertical" and v.text != "horizontal" then addError(result, path, "Property '" + name + "' on " + typ + " must be 'vertical' or 'horizontal'.") end if
    if name == "resizeMode" and v.kind == "string" and v.text != "scale" and v.text != "none" and v.text != "anchor" and v.text != "fill" then addError(result, path, "Property '" + name + "' on " + typ + " must be 'scale', 'none', 'anchor' or 'fill'.") end if
    if name == "items" then
      if v.kind != "array" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of strings.")
      else if len(v.items) > 0 then
        for itemIndex = 0 to len(v.items) - 1
          if typ == "TreeView" then
            if v.items[itemIndex].kind != "string" and v.items[itemIndex].kind != "object" then addError(result, path, "Property '" + name + "' on " + typ + " must contain strings or tree item objects.") end if
          else if typ == "ListView" or typ == "Table" or typ == "DataGrid" or typ == "PropertyGrid" then
            if v.items[itemIndex].kind == "array" then
              rowItems = v.items[itemIndex].items
              if len(rowItems) > 0 then
                for rowItemIndex = 0 to len(rowItems) - 1
                  if rowItems[rowItemIndex].kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must contain strings or arrays of strings.") end if
                end for
              end if
            else if v.items[itemIndex].kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must contain strings or arrays of strings.") end if
          else
            if v.items[itemIndex].kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of strings.") end if
          end if
        end for
      end if
    end if
    if name == "columns" then
      if v.kind != "array" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of strings.")
      else if len(v.items) > 0 then
        for columnIndex = 0 to len(v.items) - 1
          if v.items[columnIndex].kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of strings.") end if
        end for
      end if
    end if
    if name == "columnWidths" then
      if v.kind != "array" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of integers.")
      else if len(v.items) > 0 then
        for columnWidthIndex = 0 to len(v.items) - 1
          if v.items[columnWidthIndex].kind != "number" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of integers.") end if
        end for
      end if
    end if
  end for
end function

/// Performs the idSeen operation for the minigui module.
/// @param ids ids value consumed by this operation.
/// @param id Stable identifier of the affected item.
function idSeen(ids, id)
  return contains(ids, id)
end function

/// Performs the testLayoutNode operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param ids ids value consumed by this operation.
function testLayoutNode(result, path, node, ids)
  if isNull(node) then
    addError(result, path, "Missing layout node.")
    return ids
  end if
  testPropertyNames(result, path, node, ["id", "type", "properties", "events", "children", "rows", "columns", "grid", "parameters"], "node")
  typ = asString(prop(node, "type"), "")
  if typ == "" then
    addError(result, path, "Node is missing required property 'type'.")
    return ids
  end if
  id = asString(prop(node, "id"), "")
  if id != "" then
    if identOk(id) == false then addError(result, path, "Invalid id '" + id + "'. Use MiniLang identifier characters.")
    else if idSeen(ids, id) then addError(result, path, "Duplicate id '" + id + "'.")
    else ids = ids + [id]
    end if
  end if
  if isLayout(typ) then
    testPropertyNames(result, path, prop(node, "properties"), ["spacing", "padding", "width", "height", "margin", "visible", "enabled", "columns", "orientation", "itemWidth", "itemHeight", "alignment", "dock", "fill", "resizeMode", "anchor", "minWidth", "minHeight", "maxWidth", "maxHeight"], typ + ".properties")
  else if isControl(typ) then
    testControlProperties(result, path, typ, prop(node, "properties"))
    events = prop(node, "events")
    if events.kind == "object" then
      allowed = allowedControlEvents(typ)
      if len(events.keys) > 0 then
        for e = 0 to len(events.keys) - 1
          ev = events.keys[e]
          if contains(allowed, ev) == false then
            hint = ""
            if ev == "clik" then hint = " Did you mean 'click'?" end if
            addError(result, path, "Unknown event '" + ev + "' for control type '" + typ + "'." + hint)
          else
            result.events = result.events + [EventEntry(id, typ, ev, asString(events.values[e], ""), path)]
          end if
        end for
      end if
    end if
  else
    addError(result, path, "Unknown control or layout type '" + typ + "'.")
  end if
  children = arrItems(prop(node, "children"))
  if len(children) > 0 then
    for c = 0 to len(children) - 1
      ids = testLayoutNode(result, path, children[c], ids)
    end for
  end if
  return ids
end function

/// Finds function arity used by the minigui module.
/// @param text Text consumed by the operation.
/// @param name Name of the affected item.
function findFunctionArity(text, name)
  needle = "function " + name + "("
  pos = str.indexOf(text, needle, 0)
  if pos < 0 then return -1 end if
  start = pos + len(needle)
  stop = str.indexOf(text, ")", start)
  if stop < 0 then return -1 end if
  raw = str.trim(str.substr(text, start, stop - start))
  if raw == "" then return 0 end if
  return len(str.split(raw, ","))
end function

/// Validates mson for the minigui workflow.
/// @param path Path of the file or directory used by the operation.
/// @param includeDirs includeDirs value consumed by this operation.
/// @param codeBehindOverride codeBehindOverride value consumed by this operation.
function validateMson(path, includeDirs, codeBehindOverride)
  result = newResult()
  entry = normalizePath(path)
  loadGraph(result, entry, includeDirs, [])
  if len(result.errors) > 0 then return result end if
  result.entryPath = entry
  for d = 0 to len(result.documents) - 1
    if result.documents[d].path == entry then result.entryDocument = result.documents[d].document end if
  end for
  entryDoc = result.entryDocument
  testPropertyNames(result, entry, entryDoc, ["$schema", "version", "namespace", "codeBehind", "imports", "resources", "application", "windows", "components"], "root")
  if prop(entryDoc, "version").kind != "number" or prop(entryDoc, "version").number != 1 then addError(result, entry, "Missing or unsupported version. Expected 1.") end if
  ns = asString(prop(entryDoc, "namespace"), "")
  if ns == "" then addError(result, entry, "Missing required property 'namespace'.") end if
  app = prop(entryDoc, "application")
  if isNull(app) then addError(result, entry, "Missing required property 'application'.")
  else testPropertyNames(result, entry, app, ["name", "startupWindow", "events"], "application")
  end if
  if len(result.windows) == 0 then addError(result, entry, "No windows found in entry or imports.") end if
  ids = []
  if len(result.windows) > 0 then
    for wi = 0 to len(result.windows) - 1
      w = result.windows[wi].window
      wp = result.windows[wi].path
      testPropertyNames(result, wp, w, ["id", "type", "properties", "events", "layout"], "window")
      wid = asString(prop(w, "id"), "")
      if asString(prop(w, "type"), "") != "Window" then addError(result, wp, "Window '" + wid + "' must have type 'Window'.") end if
      if wid == "" then addError(result, wp, "Window is missing required property 'id'.")
      else if identOk(wid) == false then addError(result, wp, "Invalid id '" + wid + "'. Use a non-reserved MiniLang identifier.")
      else if idSeen(ids, wid) then addError(result, wp, "Duplicate id '" + wid + "'.")
      else ids = ids + [wid]
      end if
      testPropertyNames(result, wp, prop(w, "properties"), ["title", "width", "height", "resizable", "startPosition", "visible", "enabled"], "Window.properties")
      we = prop(w, "events")
      if we.kind == "object" and len(we.keys) > 0 then
        for e = 0 to len(we.keys) - 1
          ev = we.keys[e]
          if contains(["load", "close", "resized"], ev) == false then addError(result, wp, "Unknown event '" + ev + "' for window '" + wid + "'.")
          else result.events = result.events + [EventEntry(wid, "Window", ev, asString(we.values[e], ""), wp)]
          end if
        end for
      end if
      expanded = expandComponents(result, wp, prop(w, "layout"))
      w = setProp(w, "layout", expanded)
      result.windows[wi].window = w
      ids = testLayoutNode(result, wp, expanded, ids)
    end for
  end if
  startup = asString(prop(app, "startupWindow"), "")
  if startup != "" and idSeen(ids, startup) == false then addError(result, entry, "Application startupWindow '" + startup + "' does not match a window id.") end if
  cb = codeBehindOverride
  if cb == "" then cb = asString(prop(entryDoc, "codeBehind"), "") end if
  if cb == "" then addError(result, entry, "Missing codeBehind property or --code-behind option.")
  else
    cbFull = resolveMsonPath(cb, dirname(entry), [])
    if cbFull == "" then addError(result, entry, "Code-behind file not found: " + cb)
    else
      result.codeBehindPath = cbFull
      txt = fs.readAllText(cbFull)
      if typeof(txt) == "error" then addError(result, entry, "Code-behind file not readable: " + cbFull)
      else
        if len(result.events) > 0 then
          for evx = 0 to len(result.events) - 1
            handler = result.events[evx].handler
            if identOk(handler) == false then
              addError(result, result.events[evx].path, "Invalid event handler name '" + handler + "'. Use a non-reserved MiniLang identifier.")
            else
              ar = findFunctionArity(txt, handler)
              if ar < 0 then addError(result, result.events[evx].path, "Event handler '" + handler + "' was assigned to " + result.events[evx].controlType + " '" + result.events[evx].id + "', but no function was found in " + cbFull + ".")
              else if ar != 2 then addError(result, result.events[evx].path, "Event handler '" + handler + "' must accept exactly 2 parameters: ui and event.")
              end if
            end if
          end for
        end if
      end if
    end if
  end if
  return result
end function

/// Performs the controlDefaultHeight operation for the minigui module.
/// @param typ typ value consumed by this operation.
function controlDefaultHeight(typ)
  if contains(["RichTextBox", "CodeEditor", "PropertyGrid", "WebView", "DrawingCanvas", "Chart"], typ) then return 180 end if
  if typ == "TrayIcon" then return 0 end if
  if typ == "MenuBar" then return 24 end if
  if typ == "ContextMenu" then return 1 end if
  if typ == "ToolBar" then return 30 end if
  if typ == "StatusBar" then return 24 end if
  if typ == "Button" then return 30 end if
  if typ == "FilePicker" or typ == "FolderPicker" or typ == "ColorPicker" then return 30 end if
  if typ == "TextBox" then return 26 end if
  if typ == "SearchBox" then return 26 end if
  if typ == "TextArea" then return 80 end if
  if typ == "PasswordBox" then return 26 end if
  if typ == "NumberBox" then return 26 end if
  if typ == "SpinBox" then return 26 end if
  if typ == "CheckBox" or typ == "RadioButton" or typ == "ToggleSwitch" then return 22 end if
  if typ == "Image" then return 96 end if
  if typ == "Separator" then return 8 end if
  if typ == "Splitter" then return 8 end if
  if typ == "LinkLabel" then return 24 end if
  if typ == "Panel" then return 120 end if
  if typ == "ScrollViewer" then return 160 end if
  if typ == "GroupBox" then return 80 end if
  if typ == "ComboBox" then return 120 end if
  if typ == "EditableComboBox" then return 120 end if
  if typ == "ListBox" then return 96 end if
  if typ == "ScrollBar" then return 100 end if
  if typ == "Slider" then return 32 end if
  if typ == "ProgressBar" then return 24 end if
  if typ == "TabControl" then return 160 end if
  if typ == "TreeView" then return 120 end if
  if typ == "ListView" or typ == "Table" or typ == "DataGrid" then return 120 end if
  if typ == "DatePicker" then return 26 end if
  if typ == "DateTimePicker" then return 26 end if
  if typ == "TimePicker" then return 26 end if
  if typ == "Calendar" then return 160 end if
  return 24
end function

/// Performs the intProp operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
/// @param fallback Value returned when no explicit result is available.
function intProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "number" then return v.number end if
  return fallback
end function

/// Performs the dimensionProp operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
/// @param fallback Value returned when no explicit result is available.
function dimensionProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "number" then return v.number end if
  if v.kind == "string" and v.text == "fill" then return fallback end if
  if v.kind == "string" and v.text == "auto" then return fallback end if
  return fallback
end function

/// Performs the clampDimension operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param axis axis value consumed by this operation.
/// @param value Value consumed or transformed by the operation.
function clampDimension(result, path, node, axis, value)
  minName = "minWidth"
  maxName = "maxWidth"
  if axis == "height" then
    minName = "minHeight"
    maxName = "maxHeight"
  end if
  minv = intProp(result, path, node, minName, -1)
  maxv = intProp(result, path, node, maxName, -1)
  if minv >= 0 and value < minv then value = minv end if
  if maxv >= 0 and value > maxv then value = maxv end if
  return value
end function

/// Performs the stackSlotWidth operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param fallback Value returned when no explicit result is available.
function stackSlotWidth(result, path, node, fallback)
  return clampDimension(result, path, node, "width", dimensionProp(result, path, node, "width", fallback))
end function

/// Performs the layoutInt operation for the minigui module.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
/// @param fallback Value returned when no explicit result is available.
function layoutInt(node, name, fallback)
  v = prop(prop(node, "properties"), name)
  if v.kind == "number" then return v.number end if
  return fallback
end function

/// Performs the boolProp operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
/// @param fallback Value returned when no explicit result is available.
function boolProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "bool" then return v.flag end if
  return fallback
end function

/// Performs the controlText operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
function controlText(result, path, node)
  v = resourceValue(result, path, prop(prop(node, "properties"), "text"))
  if v.kind == "string" then return v.text end if
  return ""
end function

/// Performs the stringProp operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
/// @param fallback Value returned when no explicit result is available.
function stringProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "string" then return v.text end if
  return fallback
end function

/// Performs the stringArrayLiteral operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
function stringArrayLiteral(result, path, node, name)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind != "array" then return "[]" end if
  if len(v.items) == 0 then return "[]" end if
  parts = list.List.withCapacity(len(v.items))
  for i = 0 to len(v.items) - 1
    parts.add(mlString(asString(v.items[i], "")))
  end for
  return "[" + str.join(parts.toArray(), ", ") + "]"
end function

/// Performs the intArrayLiteral operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
function intArrayLiteral(result, path, node, name)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind != "array" then return "[]" end if
  if len(v.items) == 0 then return "[]" end if
  parts = list.List.withCapacity(len(v.items))
  for i = 0 to len(v.items) - 1
    item = resourceValue(result, path, v.items[i])
    if item.kind == "number" then parts.add("" + item.number) end if
  end for
  return "[" + str.join(parts.toArray(), ", ") + "]"
end function

/// Collects tree item literals for the minigui workflow.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param parts parts value consumed by this operation.
/// @param item item value consumed by this operation.
/// @param level level value consumed by this operation.
function collectTreeItemLiterals(result, path, parts, item, level)
  prefixBuilder = sb.StringBuilder.withCapacity(level * 2)
  if level > 0 then
    for i = 0 to level - 1
      prefixBuilder.appendString("  ")
    end for
  end if
  prefix = prefixBuilder.toString()
  if item.kind == "string" then
    parts.add(mlString(prefix + item.text))
    return
  end if
  if item.kind != "object" then return end if
  label = asString(resourceValue(result, path, prop(item, "text")), "")
  if label == "" then label = asString(resourceValue(result, path, prop(item, "label")), "") end if
  if label == "" then return end if
  parts.add(mlString(prefix + label))
  children = arrItems(resourceValue(result, path, prop(item, "children")))
  if len(children) > 0 then
    for c = 0 to len(children) - 1
      collectTreeItemLiterals(result, path, parts, children[c], level + 1)
    end for
  end if
end function

/// Performs the treeArrayLiteral operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
function treeArrayLiteral(result, path, node, name)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind != "array" then return "[]" end if
  parts = list.List.withCapacity(len(v.items))
  if len(v.items) > 0 then
    for i = 0 to len(v.items) - 1
      collectTreeItemLiterals(result, path, parts, v.items[i], 0)
    end for
  end if
  return "[" + str.join(parts.toArray(), ", ") + "]"
end function

/// Performs the tableArrayLiteral operation for the minigui module.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param name Name of the affected item.
function tableArrayLiteral(result, path, node, name)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind != "array" then return "[]" end if
  if len(v.items) == 0 then return "[]" end if
  parts = list.List.withCapacity(len(v.items))
  for i = 0 to len(v.items) - 1
    item = resourceValue(result, path, v.items[i])
    if item.kind == "array" then
      row = list.List.withCapacity(len(item.items))
      if len(item.items) > 0 then
        for c = 0 to len(item.items) - 1
          row.add(asString(resourceValue(result, path, item.items[c]), ""))
        end for
      end if
      parts.add(mlString(str.join(row.toArray(), "\t")))
    else
      parts.add(mlString(asString(item, "")))
    end if
  end for
  return "[" + str.join(parts.toArray(), ", ") + "]"
end function

/// Creates call for for the minigui module.
/// @param typ typ value consumed by this operation.
function createCallFor(typ)
  if contains(["RichTextBox", "CodeEditor", "PropertyGrid", "TrayIcon", "WebView", "DrawingCanvas", "Chart"], typ) then return "MiniGui." + typ + ".create" end if
  if typ == "Label" then return "MiniGui.Label.create" end if
  if typ == "Button" then return "MiniGui.Button.create" end if
  if typ == "FilePicker" then return "MiniGui.FilePicker.create" end if
  if typ == "FolderPicker" then return "MiniGui.FolderPicker.create" end if
  if typ == "ColorPicker" then return "MiniGui.ColorPicker.create" end if
  if typ == "SearchBox" then return "MiniGui.SearchBox.create" end if
  if typ == "TextArea" then return "MiniGui.TextArea.create" end if
  if typ == "PasswordBox" then return "MiniGui.PasswordBox.create" end if
  if typ == "NumberBox" then return "MiniGui.NumberBox.create" end if
  if typ == "SpinBox" then return "MiniGui.SpinBox.create" end if
  if typ == "CheckBox" then return "MiniGui.CheckBox.create" end if
  if typ == "ToggleSwitch" then return "MiniGui.ToggleSwitch.create" end if
  if typ == "RadioButton" then return "MiniGui.RadioButton.create" end if
  if typ == "Image" then return "MiniGui.Image.create" end if
  if typ == "Separator" then return "MiniGui.Separator.create" end if
  if typ == "Splitter" then return "MiniGui.Splitter.create" end if
  if typ == "LinkLabel" then return "MiniGui.LinkLabel.create" end if
  if typ == "Panel" then return "MiniGui.Panel.create" end if
  if typ == "ScrollViewer" then return "MiniGui.ScrollViewer.create" end if
  if typ == "GroupBox" then return "MiniGui.GroupBox.create" end if
  if typ == "ComboBox" then return "MiniGui.ComboBox.create" end if
  if typ == "EditableComboBox" then return "MiniGui.EditableComboBox.create" end if
  if typ == "ListBox" then return "MiniGui.ListBox.create" end if
  if typ == "ScrollBar" then return "MiniGui.ScrollBar.create" end if
  if typ == "Slider" then return "MiniGui.Slider.create" end if
  if typ == "ProgressBar" then return "MiniGui.ProgressBar.create" end if
  if typ == "TabControl" then return "MiniGui.TabControl.create" end if
  if typ == "MenuBar" then return "MiniGui.MenuBar.create" end if
  if typ == "ContextMenu" then return "MiniGui.ContextMenu.create" end if
  if typ == "StatusBar" then return "MiniGui.StatusBar.create" end if
  if typ == "ToolBar" then return "MiniGui.ToolBar.create" end if
  if typ == "TreeView" then return "MiniGui.TreeView.create" end if
  if typ == "ListView" or typ == "Table" then return "MiniGui.ListView.create" end if
  if typ == "DataGrid" then return "MiniGui.DataGrid.create" end if
  if typ == "DatePicker" then return "MiniGui.DatePicker.create" end if
  if typ == "DateTimePicker" then return "MiniGui.DateTimePicker.create" end if
  if typ == "TimePicker" then return "MiniGui.TimePicker.create" end if
  if typ == "Calendar" then return "MiniGui.Calendar.create" end if
  return "MiniGui.TextBox.create"
end function

/// Adds generated node to the state managed by the minigui module.
/// @param lines lines value consumed by this operation.
/// @param fields fields value consumed by this operation.
/// @param result Result object populated or inspected by the operation.
/// @param path Path of the file or directory used by the operation.
/// @param node node value consumed by this operation.
/// @param parentVar parentVar value consumed by this operation.
/// @param parentType parentType value consumed by this operation.
/// @param x Horizontal coordinate used by the operation.
/// @param y Vertical coordinate used by the operation.
/// @param width Width in the coordinate or storage units used by the caller.
/// @param height Height in the coordinate or storage units used by the caller.
function addGeneratedNode(lines, fields, result, path, node, parentVar, parentType, x, y, width, height)
  typ = asString(prop(node, "type"), "")
  if isControl(typ) then
    id = asString(prop(node, "id"), "")
    if id == "" then id = "__" + typ + "_" + lines.len() end if
    var = miniIdent(id)
    w = dimensionProp(result, path, node, "width", width)
    h = dimensionProp(result, path, node, "height", controlDefaultHeight(typ))
    if boolProp(result, path, node, "fill", false) then w = width end if
    dock = stringProp(result, path, node, "dock", "")
    if dock == "fill" then
      w = width
      h = height
    end if
    defaultAlign = "fill"
    explicitWidth = resourceValue(result, path, prop(prop(node, "properties"), "width"))
    if explicitWidth.kind == "number" then defaultAlign = "left" end if
    align = stringProp(result, path, node, "alignment", stringProp(result, path, node, "horizontalAlignment", defaultAlign))
    valign = stringProp(result, path, node, "verticalAlignment", "")
    w = clampDimension(result, path, node, "width", w)
    h = clampDimension(result, path, node, "height", h)
    if align == "fill" or align == "stretch" then w = clampDimension(result, path, node, "width", width) end if
    if align == "right" then x = x + width - w end if
    if align == "center" then x = x + ((width - w) >> 1) end if
    if valign == "fill" or valign == "stretch" then h = clampDimension(result, path, node, "height", height) end if
    if valign == "bottom" then y = y + height - h end if
    if valign == "center" then y = y + ((height - h) >> 1) end if
    x = intPart(x)
    y = intPart(y)
    w = intPart(w)
    h = intPart(h)
    if w < 1 then w = 1 end if
    if h < 1 then h = 1 end if
    if typ == "Panel" and parentType == "TabControl" then
      lines.add(var + " = MiniGui.Panel.createTabPage(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ")")
    else if typ == "FilePicker" then
      pickerTitle = stringProp(result, path, node, "title", "Open file")
      pickerFilter = stringProp(result, path, node, "filter", "All files (*.*)|*.*")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(pickerTitle) + ", " + mlString(pickerFilter) + ")")
    else if typ == "FolderPicker" then
      folderTitle = stringProp(result, path, node, "title", "Choose folder")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(folderTitle) + ")")
    else if typ == "ColorPicker" then
      colorTitle = stringProp(result, path, node, "title", "Choose color")
      colorValue = stringProp(result, path, node, "value", "#336699")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(colorTitle) + ", " + mlString(colorValue) + ")")
    else if typ == "CheckBox" or typ == "RadioButton" or typ == "ToggleSwitch" then
      checked = "false"
      if boolProp(result, path, node, "checked", false) then checked = "true" end if
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + checked + ")")
    else if typ == "NumberBox" or typ == "SpinBox" then
      numberMin = intProp(result, path, node, "minimum", 0)
      numberMax = intProp(result, path, node, "maximum", 100)
      numberValue = intProp(result, path, node, "value", numberMin)
      numberStep = intProp(result, path, node, "step", 1)
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + numberMin + ", " + numberMax + ", " + numberValue + ", " + numberStep + ")")
    else if typ == "Image" then
      source = stringProp(result, path, node, "source", "")
      stretch = stringProp(result, path, node, "stretch", "none")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(source) + ", " + mlString(stretch) + ")")
    else if typ == "Separator" or typ == "Splitter" then
      sepOrientation = stringProp(result, path, node, "orientation", "horizontal")
      if typ == "Splitter" then
        targetBefore = stringProp(result, path, node, "targetBefore", "")
        targetAfter = stringProp(result, path, node, "targetAfter", "")
        if targetBefore != "" or targetAfter != "" then
          lines.add(var + " = MiniGui.Splitter.createPane(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(sepOrientation) + ", " + mlString(targetBefore) + ", " + mlString(targetAfter) + ")")
        else
          lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(sepOrientation) + ")")
        end if
      else
        lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(sepOrientation) + ")")
      end if
    else if typ == "LinkLabel" then
      url = stringProp(result, path, node, "url", "")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(url) + ")")
    else if typ == "ScrollViewer" then
      hscroll = "false"
      vscroll = "true"
      if boolProp(result, path, node, "horizontalScroll", false) then hscroll = "true" end if
      if boolProp(result, path, node, "verticalScroll", true) == false then vscroll = "false" end if
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + hscroll + ", " + vscroll + ")")
    else if typ == "ComboBox" or typ == "EditableComboBox" or typ == "ListBox" then
      items = stringArrayLiteral(result, path, node, "items")
      selectedIndex = intProp(result, path, node, "selectedIndex", -1)
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + items + ", " + selectedIndex + ")")
    else if typ == "PropertyGrid" then
      items = tableArrayLiteral(result, path, node, "items")
      lines.add(var + " = MiniGui.PropertyGrid.create(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + items + ")")
    else if typ == "ListView" or typ == "Table" or typ == "DataGrid" then
      items = tableArrayLiteral(result, path, node, "items")
      columns = stringArrayLiteral(result, path, node, "columns")
      selectedIndex = intProp(result, path, node, "selectedIndex", -1)
      if typ == "DataGrid" then
        lines.add(var + " = MiniGui.DataGrid.create(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + columns + ", " + items + ", " + selectedIndex + ")")
      else if columns == "[]" then
        lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + items + ", " + selectedIndex + ")")
      else
        lines.add(var + " = MiniGui.ListView.createColumns(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + columns + ", " + items + ", " + selectedIndex + ")")
      end if
    else if typ == "TabControl" then
      itemsTab = stringArrayLiteral(result, path, node, "items")
      selectedTab = intProp(result, path, node, "selectedIndex", 0)
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + itemsTab + ", " + selectedTab + ")")
    else if typ == "TreeView" then
      itemsText = treeArrayLiteral(result, path, node, "items")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + itemsText + ")")
    else if typ == "MenuBar" or typ == "ToolBar" or typ == "ContextMenu" then
      itemsText = stringArrayLiteral(result, path, node, "items")
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + itemsText + ")")
    else if typ == "ScrollBar" or typ == "Slider" then
      defaultOrientation = "vertical"
      if typ == "Slider" then defaultOrientation = "horizontal" end if
      orientation = stringProp(result, path, node, "orientation", defaultOrientation)
      minimum = intProp(result, path, node, "minimum", 0)
      maximum = intProp(result, path, node, "maximum", 100)
      value = intProp(result, path, node, "value", minimum)
      smallStep = intProp(result, path, node, "smallStep", 1)
      largeStep = intProp(result, path, node, "largeStep", 10)
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(orientation) + ", " + minimum + ", " + maximum + ", " + value + ", " + smallStep + ", " + largeStep + ")")
    else if typ == "ProgressBar" then
      progressMin = intProp(result, path, node, "minimum", 0)
      progressMax = intProp(result, path, node, "maximum", 100)
      progressValue = intProp(result, path, node, "value", progressMin)
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + progressMin + ", " + progressMax + ", " + progressValue + ")")
    else
      lines.add(var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ")")
    end if
    if typ == "CodeEditor" then lines.add("MiniGui.CodeEditor.setLanguage(" + var + ", " + mlString(stringProp(result, path, node, "language", "minilang")) + ")") end if
    if typ == "WebView" then
      url = stringProp(result, path, node, "url", "")
      html = stringProp(result, path, node, "html", "")
      if url != "" then lines.add("MiniGui.WebView.navigate(" + var + ", " + mlString(url) + ")") end if
      if html != "" then lines.add("MiniGui.WebView.loadHtml(" + var + ", " + mlString(html) + ")") end if
    end if
    if typ == "TrayIcon" then
      lines.add("MiniGui.TrayIcon.setItems(" + var + ", " + stringArrayLiteral(result, path, node, "items") + ")")
      iconSource = stringProp(result, path, node, "source", "")
      if iconSource != "" then lines.add("MiniGui.TrayIcon.setIcon(" + var + ", " + mlString(iconSource) + ")") end if
    end if
    if typ == "Chart" then lines.add("MiniGui.Chart.setValues(" + var + ", " + intArrayLiteral(result, path, node, "values") + ", " + mlString(stringProp(result, path, node, "chartType", "bar")) + ", " + mlString(stringProp(result, path, node, "color", "#3867d6")) + ")") end if
    nodeProps = prop(node, "properties")
    if hasProp(nodeProps, "resizeMode") or hasProp(nodeProps, "anchor") or hasProp(nodeProps, "minWidth") or hasProp(nodeProps, "minHeight") or hasProp(nodeProps, "maxWidth") or hasProp(nodeProps, "maxHeight") then
      resizeMode = stringProp(result, path, node, "resizeMode", "scale")
      anchor = stringProp(result, path, node, "anchor", "left,top")
      minWidth = intProp(result, path, node, "minWidth", -1)
      minHeight = intProp(result, path, node, "minHeight", -1)
      maxWidth = intProp(result, path, node, "maxWidth", -1)
      maxHeight = intProp(result, path, node, "maxHeight", -1)
      lines.add("MiniGui.Control.setLayout(" + var + ", " + mlString(resizeMode) + ", " + mlString(anchor) + ", " + minWidth + ", " + minHeight + ", " + maxWidth + ", " + maxHeight + ")")
    end if
    if boolProp(result, path, node, "enabled", true) == false then lines.add("MiniGui.Control.setEnabled(" + var + ", false)") end if
    if boolProp(result, path, node, "visible", true) == false then lines.add("MiniGui.Control.setVisible(" + var + ", false)") end if
    tooltip = stringProp(result, path, node, "tooltip", "")
    if tooltip != "" then lines.add("MiniGui.Control.setTooltip(" + var + ", " + mlString(tooltip) + ")") end if
    tabIndex = intProp(result, path, node, "tabIndex", -1)
    if tabIndex >= 0 then lines.add("MiniGui.Control.setTabIndex(" + var + ", " + tabIndex + ")") end if
    foreground = stringProp(result, path, node, "foreground", "")
    if foreground != "" then lines.add("MiniGui.Control.setForeground(" + var + ", " + mlString(foreground) + ")") end if
    background = stringProp(result, path, node, "background", "")
    if background != "" then lines.add("MiniGui.Control.setBackground(" + var + ", " + mlString(background) + ")") end if
    borderColor = stringProp(result, path, node, "borderColor", "")
    borderWidth = intProp(result, path, node, "borderWidth", -1)
    if borderColor != "" or borderWidth >= 0 then lines.add("MiniGui.Control.setBorder(" + var + ", " + mlString(borderColor) + ", " + borderWidth + ")") end if
    fontFamily = stringProp(result, path, node, "fontFamily", "")
    fontSize = intProp(result, path, node, "fontSize", -1)
    fontWeight = stringProp(result, path, node, "fontWeight", "")
    if fontFamily != "" or fontSize >= 0 or fontWeight != "" then lines.add("MiniGui.Control.setFont(" + var + ", " + mlString(fontFamily) + ", " + fontSize + ", " + mlString(fontWeight) + ")") end if
    if boolProp(result, path, node, "readOnly", false) then lines.add("MiniGui.Control.setReadOnly(" + var + ", true)") end if
    maxLength = intProp(result, path, node, "maxLength", -1)
    if maxLength >= 0 then lines.add("MiniGui.Control.setMaxLength(" + var + ", " + maxLength + ")") end if
    if typ == "ListView" or typ == "Table" or typ == "DataGrid" then
      columnWidths = intArrayLiteral(result, path, node, "columnWidths")
      if columnWidths != "[]" then lines.add("MiniGui.Control.setColumnWidths(" + var + ", " + columnWidths + ")") end if
      if typ == "DataGrid" and boolProp(result, path, node, "editable", false) then lines.add("MiniGui.Control.setEditable(" + var + ", true)") end if
    end if
    if listContains(fields, var) == false then fields.add(var) end if
    if typ == "ContextMenu" or typ == "TrayIcon" then return [lines, fields, 0] end if
    if isContainerControl(typ) then
      childPadding = intProp(result, path, node, "padding", 8)
      childSpacing = intProp(result, path, node, "spacing", 6)
      childY = childPadding
      if typ == "GroupBox" then childY = childPadding + 14 end if
      if typ == "TabControl" then childY = 30 end if
      childNodes = arrItems(prop(node, "children"))
      if len(childNodes) > 0 then
        for childIndex = 0 to len(childNodes) - 1
          childType = asString(prop(childNodes[childIndex], "type"), "")
          childX = childPadding
          childW = w - childPadding * 2
          if typ == "TabControl" then
            childX = 0
            childW = w
          end if
          childSlotY = childY
          childSlotH = controlDefaultHeight(childType)
          if typ == "TabControl" then
            childSlotH = h - childY
            if childSlotH < 1 then childSlotH = controlDefaultHeight(childType) end if
          end if
          rChild = addGeneratedNode(lines, fields, result, path, childNodes[childIndex], var, typ, childX, childSlotY, childW, childSlotH)
          lines = rChild[0]; fields = rChild[1]
          if typ != "TabControl" then childY = childY + rChild[2] + childSpacing end if
        end for
      end if
    end if
    return [lines, fields, h]
  end if
  padding = layoutInt(node, "padding", 0)
  spacing = layoutInt(node, "spacing", 6)
  children = arrItems(prop(node, "children"))
  // MiniLang's inclusive for-range also descends when the upper bound is -1.
  // Handle empty layouts before any `0 to len(children) - 1` traversal.
  if len(children) == 0 then
    if typ == "DockPanel" then return [lines, fields, height] end if
    if typ == "Canvas" then return [lines, fields, 0] end if
    return [lines, fields, padding * 2]
  end if
  if typ == "HorizontalStack" then
    cx = x + padding
    maxh = 0
    for i = 0 to len(children) - 1
      slotW = stackSlotWidth(result, path, children[i], 120)
      r = addGeneratedNode(lines, fields, result, path, children[i], parentVar, parentType, cx, y + padding, slotW, height - padding * 2)
      lines = r[0]; fields = r[1]
      if r[2] > maxh then maxh = r[2] end if
      cx = cx + slotW + spacing
    end for
    return [lines, fields, maxh + padding * 2]
  end if
  if typ == "Grid" then
    cols = layoutInt(node, "columns", 2)
    if cols < 1 then cols = 1 end if
    cellW = (width - padding * 2 - spacing * (cols - 1)) / cols
    if cellW < 1 then cellW = 1 end if
    cxg = x + padding
    cyg = y + padding
    rowMax = 0
    usedGrid = padding
    for gi = 0 to len(children) - 1
      col = gi
      while col >= cols
        col = col - cols
      end while
      gx = cxg + col * (cellW + spacing)
      childTypeGrid = asString(prop(children[gi], "type"), "")
      childHGrid = dimensionProp(result, path, children[gi], "height", controlDefaultHeight(childTypeGrid))
      rg = addGeneratedNode(lines, fields, result, path, children[gi], parentVar, parentType, gx, cyg, cellW, childHGrid)
      lines = rg[0]; fields = rg[1]
      if rg[2] > rowMax then rowMax = rg[2] end if
      if col == cols - 1 or gi == len(children) - 1 then
        cyg = cyg + rowMax + spacing
        usedGrid = usedGrid + rowMax + spacing
        rowMax = 0
      end if
    end for
    if len(children) > 0 then usedGrid = usedGrid - spacing end if
    return [lines, fields, usedGrid + padding]
  end if
  if typ == "DockPanel" then
    rx = x + padding
    ry = y + padding
    rw = width - padding * 2
    rh = height - padding * 2
    usedDock = padding
    for di = 0 to len(children) - 1
      child = children[di]
      childTypeDock = asString(prop(child, "type"), "")
      dock = stringProp(result, path, child, "dock", "top")
      if di == len(children) - 1 and dock == "top" then dock = "fill" end if
      childW = dimensionProp(result, path, child, "width", rw)
      childH = dimensionProp(result, path, child, "height", controlDefaultHeight(childTypeDock))
      dx = rx
      dy = ry
      dw = rw
      dh = childH
      if dock == "bottom" then
        dy = ry + rh - childH
        dh = childH
      else if dock == "left" then
        dw = childW
        dh = rh
      else if dock == "right" then
        dx = rx + rw - childW
        dw = childW
        dh = rh
      else if dock == "fill" then
        dw = rw
        dh = rh
      end if
      rd = addGeneratedNode(lines, fields, result, path, child, parentVar, parentType, dx, dy, dw, dh)
      lines = rd[0]; fields = rd[1]
      if dock == "top" then
        ry = ry + rd[2] + spacing
        rh = rh - rd[2] - spacing
      else if dock == "bottom" then
        rh = rh - rd[2] - spacing
      else if dock == "left" then
        rx = rx + dw + spacing
        rw = rw - dw - spacing
      else if dock == "right" then
        rw = rw - dw - spacing
      end if
      if rh < 1 then rh = 1 end if
      if rw < 1 then rw = 1 end if
    end for
    return [lines, fields, height]
  end if
  if typ == "WrapPanel" then
    wx = x + padding
    wy = y + padding
    rowHeight = 0
    maxRight = x + width - padding
    usedWrap = padding
    for wi = 0 to len(children) - 1
      childWrap = children[wi]
      childTypeWrap = asString(prop(childWrap, "type"), "")
      ww = stackSlotWidth(result, path, childWrap, 120)
      wh = dimensionProp(result, path, childWrap, "height", controlDefaultHeight(childTypeWrap))
      if wx > x + padding and wx + ww > maxRight then
        wx = x + padding
        wy = wy + rowHeight + spacing
        usedWrap = usedWrap + rowHeight + spacing
        rowHeight = 0
      end if
      rwc = addGeneratedNode(lines, fields, result, path, childWrap, parentVar, parentType, wx, wy, ww, wh)
      lines = rwc[0]; fields = rwc[1]
      if rwc[2] > rowHeight then rowHeight = rwc[2] end if
      wx = wx + ww + spacing
    end for
    if len(children) > 0 then usedWrap = usedWrap + rowHeight end if
    return [lines, fields, usedWrap + padding]
  end if
  if typ == "Canvas" then
    maxb = 0
    for c = 0 to len(children) - 1
      props = prop(children[c], "properties")
      cx2 = asInt(prop(props, "x"), x)
      cy2 = asInt(prop(props, "y"), y)
      r2 = addGeneratedNode(lines, fields, result, path, children[c], parentVar, parentType, cx2, cy2, width, controlDefaultHeight(asString(prop(children[c], "type"), "")))
      lines = r2[0]; fields = r2[1]
      bottom = (cy2 - y) + r2[2]
      if bottom > maxb then maxb = bottom end if
    end for
    return [lines, fields, maxb]
  end if
  cy = y + padding
  usedTotal = padding
  for j = 0 to len(children) - 1
    r3 = addGeneratedNode(lines, fields, result, path, children[j], parentVar, parentType, x + padding, cy, width - padding * 2, controlDefaultHeight(asString(prop(children[j], "type"), "")))
    lines = r3[0]; fields = r3[1]
    cy = cy + r3[2] + spacing
    usedTotal = usedTotal + r3[2] + spacing
  end for
  if len(children) > 0 then usedTotal = usedTotal - spacing end if
  return [lines, fields, usedTotal + padding]
end function

/// Generates code for the minigui workflow.
/// @param result Result object populated or inspected by the operation.
/// @param outputPath Path associated with output.
function generateCode(result, outputPath)
  entryDoc = result.entryDocument
  ns = asString(prop(entryDoc, "namespace"), "minigui_app")
  uiType = miniGuiTypeName(ns) + "Ui"
  outFull = normalizePath(outputPath)
  ensureDir(dirname(outFull))
  cbRel = relativePath(dirname(outFull), result.codeBehindPath)
  fields = list.List.new()
  fields.add("app")
  body = list.List.new()
  body.addAll(["// Generated from " + result.entryPath, "app = MiniGui.Application.create()", "#if TARGET_OS == \"windows\"", "miniguiWindowProcPtr = nativeCallback(miniguiWindowProc, \"wndproc\")", "miniguiTimerProcPtr = nativeCallback(miniguiTimerProc, \"wndproc\")", "#endif"])
  for i = 0 to len(result.windows) - 1
    w = result.windows[i].window
    path = result.windows[i].path
    wid0 = asString(prop(w, "id"), "window")
    wid = miniIdent(wid0)
    props = prop(w, "properties")
    titleV = resourceValue(result, path, prop(props, "title"))
    title = jsonScalarToString(titleV)
    if title == "" then title = wid end if
    ww = asInt(resourceValue(result, path, prop(props, "width")), 640)
    wh = asInt(resourceValue(result, path, prop(props, "height")), 400)
    body.addAll(["", "// Window '" + wid + "' from " + path, wid + " = MiniGui.Window.create(app, " + mlString(wid) + ", " + mlString(title) + ", " + ww + ", " + wh + ")", "#if TARGET_OS == \"windows\"", "MiniGui.Window.installProc(" + wid + ", miniguiWindowProcPtr)", "MiniGui.Window.startResizeTimer(" + wid + ", miniguiTimerProcPtr)", "#endif"])
    if listContains(fields, wid) == false then fields.add(wid) end if
    r = addGeneratedNode(body, fields, result, path, prop(w, "layout"), wid, "Window", 0, 0, ww - 40, wh - 80)
  end for
  body.addAll(["", "ui = " + uiType + "(" + str.join(fields.toArray(), ", ") + ")"])
  wrappers = list.List.new()
  if len(result.events) > 0 then
    for e = 0 to len(result.events) - 1
      ev = result.events[e]
      cid = miniIdent(ev.id)
      wrapper = "miniguiEvent" + e
      wrappers.add([wrapper, ev.handler])
      if ev.eventName == "load" then body.add("MiniGui.Events.bindLoad(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "close" then body.add("MiniGui.Events.bindClose(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "resized" then body.add("MiniGui.Events.bindResized(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "click" then body.add("MiniGui.Events.bindClick(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "clicked" then body.add("MiniGui.Events.bindClicked(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "focus" then body.add("MiniGui.Events.bindFocus(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "blur" then body.add("MiniGui.Events.bindBlur(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "selectionChanged" then body.add("MiniGui.Events.bindSelectionChanged(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "selected" then body.add("MiniGui.Events.bindSelected(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "scrollChanged" then body.add("MiniGui.Events.bindScrollChanged(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "valueChanged" then body.add("MiniGui.Events.bindValueChanged(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "changed" then body.add("MiniGui.Events.bindChanged(app, " + cid + ", " + wrapper + ", ui)")
      else if ev.eventName == "change" or ev.eventName == "submit" or ev.eventName == "validating" or ev.eventName == "validated" then body.add("MiniGui.Events.bindChange(app, " + cid + ", " + wrapper + ", ui)")
      else body.add("MiniGui.Events.bindTextChanged(app, " + cid + ", " + wrapper + ", ui)")
      end if
    end for
  end if
  startup = miniIdent(asString(prop(prop(entryDoc, "application"), "startupWindow"), ""))
  if startup == "_" and len(result.windows) > 0 then startup = miniIdent(asString(prop(result.windows[0].window, "id"), "window")) end if
  body.addAll(["MiniGui.Application.setStartupWindow(app, " + startup + ")", "MiniGui.Window.show(" + startup + ")", "return MiniGui.Application.run(app)"])
  lines = list.List.new()
  lines.addAll(["// <auto-generated> MiniGui generated code. Do not edit by hand.", "import MiniGuiLib.minigui as MiniGui", "import " + mlString(cbRel) + " as CodeBehind", "", "struct " + uiType])
  for f = 0 to fields.len() - 1
    lines.add("  " + fields.get(f) + ",")
  end for
  lines.addAll(["end struct", ""])
  lines.addAll(["#if TARGET_OS == \"windows\"", "function miniguiWindowProc(hwnd, msg, wParam, lParam)", "  return MiniGui.Application.windowProc(hwnd, msg, wParam, lParam)", "end function", ""])
  lines.addAll(["function miniguiTimerProc(hwnd, msg, wParam, lParam)", "  return MiniGui.Application.timerProc(hwnd, msg, wParam, lParam)", "end function", "#endif", ""])
  if wrappers.len() > 0 then
    for widx = 0 to wrappers.len() - 1
      wrapperEntry = wrappers.get(widx)
      lines.addAll(["function " + wrapperEntry[0] + "(ui, event)", "  return CodeBehind." + wrapperEntry[1] + "(ui, event)", "end function", ""])
    end for
  end if
  lines.add("function main(args)")
  for b = 0 to body.len() - 1
    bodyLine = body.get(b)
    if bodyLine == "" then lines.add("")
    else lines.add("  " + bodyLine)
    end if
  end for
  lines.add("end function")
  ok = fs.writeAllText(outFull, str.join(lines.toArray(), "\n") + "\n")
  if typeof(ok) == "error" then return ok end if
  return outFull
end function

/// Parses options for the minigui workflow.
/// @param args Command-line or caller-supplied arguments.
/// @param start start value consumed by this operation.
function parseOptions(args, start)
  opts = [["output", ""], ["codeBehind", ""], ["generatedDir", ""], ["compiler", HOST_COMPILER], ["libraryDir", "."], ["noCompile", "false"], ["keepGenerated", "false"], ["target", HOST_TARGET]]
  includes = list.List.new()
  i = start
  while i < len(args)
    a = args[i]
    if a == "--output" or a == "--code-behind" or a == "--generated-dir" or a == "--compiler" or a == "--library-dir" or a == "--include-dir" or a == "--target" then
      if i + 1 >= len(args) then return error(2, "Missing value for option: " + a) end if
      i = i + 1
      if a == "--output" then opts[0][1] = args[i]
      else if a == "--code-behind" then opts[1][1] = args[i]
      else if a == "--generated-dir" then opts[2][1] = args[i]
      else if a == "--compiler" then opts[3][1] = args[i]
      else if a == "--library-dir" then opts[4][1] = args[i]
      else if a == "--target" then opts[7][1] = args[i]
      else includes.add(normalizePath(args[i]))
      end if
    else if a == "--no-compile" then opts[5][1] = "true"
    else if a == "--keep-generated" then opts[6][1] = "true"
    else if a == "--verbose" or a == "--debug" or a == "--release" then
      // accepted for compatibility
    else
      return error(2, "Unknown option: " + a)
    end if
    i = i + 1
  end while
  if opts[7][1] != "windows-x64" and opts[7][1] != "linux-x64" then return error(2, "Unsupported target: " + opts[7][1]) end if
  return [opts, includes.toArray()]
end function

/// Performs the opt operation for the minigui module.
/// @param opts opts value consumed by this operation.
/// @param name Name of the affected item.
function opt(opts, name)
  for i = 0 to len(opts) - 1
    if opts[i][0] == name then return opts[i][1] end if
  end for
  return ""
end function

/// Performs the usage operation for the minigui module.
function usage()
  print "Usage:"
  print "  minigui validate <app.mson> [--include-dir <dir>] [--code-behind <file>]"
  print "  minigui generate <app.mson> --output <app.gui.ml>"
  print "  minigui build <app.mson> --output <app> --target windows-x64|linux-x64 [--no-compile]"
end function

/// Runs the selected MiniLang compiler without involving a command shell.
/// @param compiler compiler value consumed by this operation.
/// @param generated generated value consumed by this operation.
/// @param outExe outExe value consumed by this operation.
/// @param libraryDir libraryDir value consumed by this operation.
/// @param target Target executable platform, windows-x64 or linux-x64.
function runCompiler(compiler, generated, outExe, libraryDir, target)
  executable = compiler
  args = [generated, outExe, "-I", libraryDir, "--target", target]
  if target == "windows-x64" then args = args + ["--subsystem", "gui"] end if
  compilerDir = dirname(normalizePath(compiler))
  compilerRoot = compilerDir
  if fs.isDir(joinPath(compilerRoot, "std")) == false then
    compilerRoot = dirname(compilerDir)
  end if
  if fs.isDir(joinPath(compilerRoot, "std")) then
    args = args + ["-I", compilerRoot]
  end if
  if str.endsWith(compiler, ".py") or str.endsWith(compiler, ".PY") then
    executable = resolvePythonInterpreter()
    if executable == "" then return -1 end if
    args = [compiler] + args
  end if
  return runProcess(executable, args)
end function

/// Writes validation for the minigui workflow.
/// @param result Result object populated or inspected by the operation.
function writeValidation(result)
  if len(result.errors) > 0 then
    for i = 0 to len(result.errors) - 1
      print result.errors[i]
    end for
    return false
  end if
  return true
end function

/// Performs the main operation for the minigui module.
/// @param args Command-line or caller-supplied arguments.
function main(args)
  if len(args) < 2 then usage(); return 2 end if
  command = args[0]
  msonPath = args[1]
  if command != "validate" and command != "generate" and command != "build" then usage(); return 2 end if
  po = parseOptions(args, 2)
  if typeof(po) == "error" then print po.message; return 2 end if
  opts = po[0]
  includes = po[1]
  result = validateMson(msonPath, includes, opt(opts, "codeBehind"))
  if writeValidation(result) == false then return 1 end if
  if command == "validate" then
    print "OK: valid MSON"
    return 0
  end if
  generatedPath = opt(opts, "output")
  if command == "build" then
    genDir = opt(opts, "generatedDir")
    if genDir == "" then genDir = joinPath(dirname(normalizePath(msonPath)), "build\\generated") end if
    generatedPath = joinPath(genDir, basenameNoExt(msonPath) + ".gui.ml")
  else if generatedPath == "" then
    generatedPath = "build\\generated\\app.gui.ml"
  end if
  generated = generateCode(result, generatedPath)
  if typeof(generated) == "error" then print generated.message; return 1 end if
  print "Generated: " + generated
  if command == "generate" or opt(opts, "noCompile") == "true" then return 0 end if
  outExe = opt(opts, "output")
  if outExe == "" then
    filename = "app"
    if opt(opts, "target") == "windows-x64" then filename = "app.exe" end if
    outExe = joinPath(dirname(normalizePath(msonPath)), "build/" + filename)
  end if
  ensureDir(dirname(outExe))
  nativeName = "libminigui_gtk.so"
  if opt(opts, "target") == "windows-x64" then nativeName = "minigui_extra.dll" end if
  nativeSource = joinPath(opt(opts, "libraryDir"), "build/native/" + opt(opts, "target") + "/" + nativeName)
  if fs.isFile(nativeSource) == false then
    print "Native backend missing: " + nativeSource
    print "Build it with native/windows/build.ps1 or native/linux/build.sh before compiling applications."
    return 1
  end if
  copied = fs.copyFile(nativeSource, joinPath(dirname(outExe), nativeName), true)
  if typeof(copied) == "error" then print copied.message; return 1 end if
  rc = runCompiler(opt(opts, "compiler"), generated, outExe, opt(opts, "libraryDir"), opt(opts, "target"))
  if rc < 0 then print "Failed to start MiniLang compiler."; return 1 end if
  if rc != 0 then return rc end if
  print "Built: " + normalizePath(outExe)
  return 0
end function
