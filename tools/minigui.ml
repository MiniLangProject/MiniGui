import std.fs as fs
import std.string as str

extern function _wsystem(cmd as wstr) from "msvcrt.dll" returns int
extern function _wmkdir(path as wstr) from "msvcrt.dll" returns int

struct JsonValue
  kind,
  text,
  number,
  flag,
  keys,
  values,
  items,
end struct

struct Parser
  text,
  pos,
  errors,
end struct

struct JsonParseResult
  ok,
  value,
  message,
end struct

struct Result
  errors,
  warnings,
  documents,
  resources,
  components,
  windows,
  events,
  entryPath,
  entryDocument,
  codeBehindPath,
end struct

struct DocEntry
  path,
  document,
end struct

struct WindowEntry
  path,
  window,
end struct

struct ComponentEntry
  name,
  definition,
  path,
end struct

struct EventEntry
  id,
  controlType,
  eventName,
  handler,
  path,
end struct

function jNull()
  return JsonValue("null", "", 0, false, [], [], [])
end function

function jString(v)
  return JsonValue("string", v, 0, false, [], [], [])
end function

function jNumber(v)
  return JsonValue("number", "", v, false, [], [], [])
end function

function jBool(v)
  return JsonValue("bool", "", 0, v, [], [], [])
end function

function jObject(keys, values)
  return JsonValue("object", "", 0, false, keys, values, [])
end function

function jArray(items)
  return JsonValue("array", "", 0, false, [], [], items)
end function

function jsonParseOk(value)
  return JsonParseResult(true, value, "")
end function

function jsonParseError(message)
  return JsonParseResult(false, jNull(), message)
end function

function newResult()
  return Result([], [], [], [], [], [], [], "", jNull(), "")
end function

function addError(result, path, message)
  result.errors = result.errors + [path + ": " + message]
end function

function hasValue(v)
  return typeof(v) == "struct" and v is JsonValue
end function

function prop(obj, name)
  if hasValue(obj) == false then return jNull() end if
  if obj.kind != "object" then return jNull() end if
  if len(obj.keys) == 0 then return jNull() end if
  for i = 0 to len(obj.keys) - 1
    if obj.keys[i] == name then return obj.values[i] end if
  end for
  return jNull()
end function

function hasProp(obj, name)
  if hasValue(obj) == false then return false end if
  if obj.kind != "object" then return false end if
  if len(obj.keys) == 0 then return false end if
  for i = 0 to len(obj.keys) - 1
    if obj.keys[i] == name then return true end if
  end for
  return false
end function

function asString(v, fallback)
  if hasValue(v) and v.kind == "string" then return v.text end if
  return fallback
end function

function asInt(v, fallback)
  if hasValue(v) and v.kind == "number" then return v.number end if
  return fallback
end function

function intPart(value)
  text = "" + value
  outv = ""
  if len(text) > 0 then
    for i = 0 to len(text) - 1
      ch = text[i]
      if ch == "." then break end if
      outv = outv + ch
    end for
  end if
  if outv == "" or outv == "-" then outv = "0" end if
  n = toNumber(outv)
  if typeof(n) == "int" then return n end if
  return 0
end function

function asBool(v, fallback)
  if hasValue(v) and v.kind == "bool" then return v.flag end if
  return fallback
end function

function isNull(v)
  if hasValue(v) == false then return true end if
  return v.kind == "null"
end function

function arrItems(v)
  if hasValue(v) and v.kind == "array" then return v.items end if
  if isNull(v) then return [] end if
  return [v]
end function

function charAt(text, i)
  if i < 0 or i >= len(text) then return "" end if
  return text[i]
end function

function ord(ch)
  if typeof(ch) != "string" or len(ch) == 0 then return -1 end if
  return bytes(ch)[0]
end function

function isDigit(ch)
  c = ord(ch)
  return c >= 48 and c <= 57
end function

function isLetter(ch)
  c = ord(ch)
  return (c >= 65 and c <= 90) or (c >= 97 and c <= 122)
end function

function isIdentStart(ch)
  return isLetter(ch) or ch == "_"
end function

function isIdentChar(ch)
  return isLetter(ch) or isDigit(ch) or ch == "_"
end function

function isWs(ch)
  return ch == " " or ch == "\r" or ch == "\n" or ch == "\t"
end function

function skipWs(p)
  while p.pos < len(p.text) and isWs(charAt(p.text, p.pos))
    p.pos = p.pos + 1
  end while
end function

function parserError(p, message)
  p.errors = p.errors + [message + " at offset " + p.pos]
end function

function hexVal(ch)
  c = ord(ch)
  if c >= 48 and c <= 57 then return c - 48 end if
  if c >= 97 and c <= 102 then return 10 + c - 97 end if
  if c >= 65 and c <= 70 then return 10 + c - 65 end if
  return -1
end function

function appendCodeUnitUtf8(outBytes, cp)
  if cp < 0 then return outBytes end if
  if cp < 128 then return outBytes + bytes([cp]) end if
  if cp < 2048 then return outBytes + bytes([192 | (cp >> 6), 128 | (cp & 63)]) end if
  return outBytes + bytes([224 | (cp >> 12), 128 | ((cp >> 6) & 63), 128 | (cp & 63)])
end function

function parseJsonString(p)
  if charAt(p.text, p.pos) != "\"" then
    parserError(p, "Expected string")
    return ""
  end if
  p.pos = p.pos + 1
  outBytes = bytes(0)
  while p.pos < len(p.text)
    ch = charAt(p.text, p.pos)
    if ch == "\"" then
      p.pos = p.pos + 1
      s0 = decode(outBytes)
      if typeof(s0) == "string" then return s0 end if
      return ""
    end if
    if ch == "\\" then
      p.pos = p.pos + 1
      esc = charAt(p.text, p.pos)
      if esc == "\"" then outBytes = outBytes + bytes("\"")
      else if esc == "\\" then outBytes = outBytes + bytes("\\")
      else if esc == "/" then outBytes = outBytes + bytes("/")
      else if esc == "b" then outBytes = outBytes + bytes([8])
      else if esc == "f" then outBytes = outBytes + bytes([12])
      else if esc == "n" then outBytes = outBytes + bytes("\n")
      else if esc == "r" then outBytes = outBytes + bytes("\r")
      else if esc == "t" then outBytes = outBytes + bytes("\t")
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
        outBytes = appendCodeUnitUtf8(outBytes, cp)
        p.pos = p.pos + 4
      else
        parserError(p, "Invalid escape")
        return ""
      end if
    else
      outBytes = outBytes + bytes(ch)
    end if
    p.pos = p.pos + 1
  end while
  parserError(p, "Unterminated string")
  return ""
end function

function parseNumber(p)
  start = p.pos
  if charAt(p.text, p.pos) == "-" then p.pos = p.pos + 1 end if
  while p.pos < len(p.text) and isDigit(charAt(p.text, p.pos))
    p.pos = p.pos + 1
  end while
  // MSON currently needs integer dimensions only. Skip fractional/exponent parts.
  if p.pos < len(p.text) and charAt(p.text, p.pos) == "." then
    p.pos = p.pos + 1
    while p.pos < len(p.text) and isDigit(charAt(p.text, p.pos))
      p.pos = p.pos + 1
    end while
  end if
  if p.pos < len(p.text) and (charAt(p.text, p.pos) == "e" or charAt(p.text, p.pos) == "E") then
    p.pos = p.pos + 1
    if charAt(p.text, p.pos) == "+" or charAt(p.text, p.pos) == "-" then p.pos = p.pos + 1 end if
    while p.pos < len(p.text) and isDigit(charAt(p.text, p.pos))
      p.pos = p.pos + 1
    end while
  end if
  raw = str.substr(p.text, start, p.pos - start)
  n = toNumber(raw)
  if typeof(n) != "int" then return 0 end if
  return n
end function

function startsAt(text, pos, needle)
  if pos + len(needle) > len(text) then return false end if
  return str.substr(text, pos, len(needle)) == needle
end function

function parseValue(p)
  skipWs(p)
  ch = charAt(p.text, p.pos)
  if ch == "{" then return parseObject(p) end if
  if ch == "[" then return parseArray(p) end if
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

function parseObject(p)
  keys = []
  vals = []
  p.pos = p.pos + 1
  skipWs(p)
  if charAt(p.text, p.pos) == "}" then
    p.pos = p.pos + 1
    return jObject(keys, vals)
  end if
  while p.pos < len(p.text)
    skipWs(p)
    key = parseJsonString(p)
    skipWs(p)
    if charAt(p.text, p.pos) != ":" then
      parserError(p, "Expected ':'")
      return jObject(keys, vals)
    end if
    p.pos = p.pos + 1
    val = parseValue(p)
    keys = keys + [key]
    vals = vals + [val]
    skipWs(p)
    ch = charAt(p.text, p.pos)
    if ch == "}" then
      p.pos = p.pos + 1
      return jObject(keys, vals)
    end if
    if ch != "," then
      parserError(p, "Expected ',' or '}'")
      return jObject(keys, vals)
    end if
    p.pos = p.pos + 1
  end while
  parserError(p, "Unterminated object")
  return jObject(keys, vals)
end function

function parseArray(p)
  items = []
  p.pos = p.pos + 1
  skipWs(p)
  if charAt(p.text, p.pos) == "]" then
    p.pos = p.pos + 1
    return jArray(items)
  end if
  while p.pos < len(p.text)
    items = items + [parseValue(p)]
    skipWs(p)
    ch = charAt(p.text, p.pos)
    if ch == "]" then
      p.pos = p.pos + 1
      return jArray(items)
    end if
    if ch != "," then
      parserError(p, "Expected ',' or ']'")
      return jArray(items)
    end if
    p.pos = p.pos + 1
  end while
  parserError(p, "Unterminated array")
  return jArray(items)
end function

function parseJson(text)
  p = Parser(text, 0, [])
  v = parseValue(p)
  skipWs(p)
  if len(p.errors) == 0 and p.pos < len(text) then parserError(p, "Unexpected trailing content") end if
  if len(p.errors) > 0 then return jsonParseError(p.errors[0]) end if
  return jsonParseOk(v)
end function

function pathSlash(p)
  return str.replaceAll(p, "/", "\\")
end function

function pathUnslash(p)
  return str.replaceAll(p, "\\", "/")
end function

function trimDotSlash(p)
  r = pathSlash(p)
  while str.startsWith(r, ".\\")
    r = str.substr(r, 2, len(r) - 2)
  end while
  return r
end function

function isRooted(p)
  if len(p) >= 3 and p[1] == ":" then return true end if
  if str.startsWith(p, "\\\\") then return true end if
  return false
end function

function dirname(path)
  p = pathSlash(path)
  last = -1
  for i = 0 to len(p) - 1
    if p[i] == "\\" then last = i end if
  end for
  if last < 0 then return "." end if
  if last == 0 then return "\\" end if
  return str.substr(p, 0, last)
end function

function basenameNoExt(path)
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
end function

function joinPath(a, b)
  if b == "" then return pathSlash(a) end if
  if isRooted(b) then return pathSlash(b) end if
  aa = pathSlash(a)
  if aa == "" or aa == "." then return pathSlash(b) end if
  if str.endsWith(aa, "\\") then return aa + pathSlash(b) end if
  return aa + "\\" + pathSlash(b)
end function

function normalizePath(p)
  pp = pathSlash(p)
  parts = str.split(pp, "\\")
  outv = []
  if len(parts) > 0 then
    for i = 0 to len(parts) - 1
      part = parts[i]
      if part == "" or part == "." then continue end if
      if part == ".." and len(outv) > 0 and outv[len(outv) - 1] != ".." then
        outv = slice(outv, 0, len(outv) - 1)
      else
        outv = outv + [part]
      end if
    end for
  end if
  if len(outv) == 0 then return "." end if
  return str.join(outv, "\\")
end function

function splitPathParts(p)
  pp = trimDotSlash(normalizePath(p))
  if pp == "." then return [] end if
  return str.split(pp, "\\")
end function

function relativePath(fromDir, toPath)
  fromParts = splitPathParts(fromDir)
  toParts = splitPathParts(toPath)
  i = 0
  while i < len(fromParts) and i < len(toParts) and fromParts[i] == toParts[i]
    i = i + 1
  end while
  outv = []
  if i < len(fromParts) then
    for j = i to len(fromParts) - 1
      outv = outv + [".."]
    end for
  end if
  if i < len(toParts) then
    for k = i to len(toParts) - 1
      outv = outv + [toParts[k]]
    end for
  end if
  if len(outv) == 0 then return "." end if
  return str.join(outv, "\\")
end function

function ensureDir(path)
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
end function

function q(s0)
  return "\"" + str.replaceAll(s0, "\"", "\\\"") + "\""
end function

function contains(arr, value)
  if len(arr) == 0 then return false end if
  for i = 0 to len(arr) - 1
    if arr[i] == value then return true end if
  end for
  return false
end function

function identOk(value)
  if typeof(value) != "string" or len(value) == 0 then return false end if
  first = value[0]
  if isIdentStart(first) == false then return false end if
  if len(value) == 1 then return true end if
  for i = 1 to len(value) - 1
    if isIdentChar(value[i]) == false then return false end if
  end for
  return true
end function

function miniIdent(value)
  if typeof(value) != "string" then return "_" end if
  if len(value) == 0 then return "_" end if
  outv = ""
  for i = 0 to len(value) - 1
    ch = value[i]
    if isIdentChar(ch) then
      outv = outv + ch
    else
      outv = outv + "_"
    end if
  end for
  if outv == "" then outv = "_" end if
  first = outv[0]
  if isIdentStart(first) then return outv end if
  return "_" + outv
end function

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

function miniGuiTypeName(ns)
  parts = str.split(ns, ".")
  outv = ""
  for i = 0 to len(parts) - 1
    p = miniIdent(parts[i])
    if p == "_" then continue end if
    outv = outv + upperFirst(p)
  end for
  if outv == "" then outv = "MiniGuiApp" end if
  return miniIdent(outv)
end function

function mlString(value)
  if typeof(value) != "string" then value = "" end if
  outv = "\""
  if len(value) == 0 then return "\"\"" end if
  for i = 0 to len(value) - 1
    ch = value[i]
    if ch == "\\" then outv = outv + "\\\\"
    else if ch == "\"" then outv = outv + "\\\""
    else if ch == "\n" then outv = outv + "\\n"
    else if ch == "\r" then outv = outv + "\\r"
    else if ch == "\t" then outv = outv + "\\t"
    else outv = outv + ch
    end if
  end for
  return outv + "\""
end function

function jsonScalarToString(v)
  if v.kind == "string" then return v.text end if
  if v.kind == "number" then return "" + v.number end if
  if v.kind == "bool" then
    if v.flag then return "true" end if
    return "false"
  end if
  return ""
end function

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

function stackHas(stack, path)
  if len(stack) == 0 then return false end if
  for i = 0 to len(stack) - 1
    if stack[i] == path then return true end if
  end for
  return false
end function

function componentByName(result, name)
  if len(result.components) == 0 then return void end if
  for i = 0 to len(result.components) - 1
    if result.components[i].name == name then return result.components[i] end if
  end for
  return void
end function

function loadGraph(result, path, includeDirs, stack)
  full = normalizePath(path)
  if stackHas(stack, full) then
    addError(result, path, "Cyclic MSON import: " + str.join(stack + [full], " -> "))
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
      result.resources = result.resources + [[resources.keys[r], resources.values[r]]]
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

function cloneJson(v)
  if v.kind == "object" then
    vals = []
    if len(v.values) > 0 then
      for i = 0 to len(v.values) - 1
        vals = vals + [cloneJson(v.values[i])]
      end for
    end if
    return jObject(v.keys, vals)
  end if
  if v.kind == "array" then
    items = []
    if len(v.items) > 0 then
      for j = 0 to len(v.items) - 1
        items = items + [cloneJson(v.items[j])]
      end for
    end if
    return jArray(items)
  end if
  return JsonValue(v.kind, v.text, v.number, v.flag, v.keys, v.values, v.items)
end function

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

function copyNodeWithPrefix(node, prefix)
  copy = cloneJson(node)
  id = asString(prop(copy, "id"), "")
  if id != "" then copy = setProp(copy, "id", jString(prefix + "_" + id)) end if
  children = arrItems(prop(copy, "children"))
  if len(children) > 0 then
    outv = []
    for i = 0 to len(children) - 1
      outv = outv + [copyNodeWithPrefix(children[i], prefix)]
    end for
    copy = setProp(copy, "children", jArray(outv))
  end if
  return copy
end function

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
    outv = []
    for i = 0 to len(children) - 1
      outv = outv + [expandComponents(result, path, children[i])]
    end for
    node = setProp(node, "children", jArray(outv))
  end if
  return node
end function

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

function allowedControlEvents(typ)
  if contains(["Button", "CheckBox", "RadioButton", "ToolBar", "MenuBar", "LinkLabel", "Image"], typ) then return ["click", "clicked"] end if
  if contains(["TextBox", "TextArea", "PasswordBox", "DatePicker"], typ) then return ["textChanged", "changed", "change", "submit", "validating", "validated"] end if
  if typ == "NumberBox" then return ["textChanged", "valueChanged", "changed", "change", "submit", "validating", "validated"] end if
  if contains(["ComboBox", "ListBox", "TabControl", "TreeView", "ListView", "Table"], typ) then return ["selectionChanged", "selected", "changed", "change"] end if
  if contains(["ScrollBar", "Slider", "ProgressBar"], typ) then return ["scrollChanged", "valueChanged", "changed", "change"] end if
  return []
end function

function commonControlProps()
  return ["text", "width", "height", "x", "y", "visible", "enabled", "margin", "horizontalAlignment", "verticalAlignment", "alignment", "dock", "fill", "minWidth", "minHeight", "maxWidth", "maxHeight", "tooltip", "tabIndex", "row", "column", "rowSpan", "columnSpan", "fontFamily", "fontSize", "fontWeight", "foreground", "background", "borderColor", "borderWidth"]
end function

function allowedControlProps(typ)
  if contains(["TextBox", "TextArea", "PasswordBox"], typ) then return commonControlProps() + ["placeholder", "readOnly", "maxLength", "inputType", "validationMessage"] end if
  if typ == "NumberBox" then return commonControlProps() + ["placeholder", "readOnly", "maxLength", "minimum", "maximum", "value", "step", "decimals", "validationMessage"] end if
  if contains(["CheckBox", "RadioButton"], typ) then return commonControlProps() + ["checked"] end if
  if contains(["ComboBox", "ListBox", "TabControl", "TreeView", "ListView", "Table"], typ) then return commonControlProps() + ["items", "selectedIndex"] end if
  if contains(["ScrollBar", "Slider"], typ) then return commonControlProps() + ["orientation", "minimum", "maximum", "value", "smallStep", "largeStep"] end if
  if typ == "ProgressBar" then return commonControlProps() + ["minimum", "maximum", "value"] end if
  if contains(["MenuBar", "ToolBar"], typ) then return commonControlProps() + ["items"] end if
  if typ == "Image" then return commonControlProps() + ["source", "stretch"] end if
  if typ == "Separator" then return commonControlProps() + ["orientation"] end if
  if typ == "LinkLabel" then return commonControlProps() + ["url", "visited"] end if
  if typ == "ScrollViewer" then return commonControlProps() + ["padding", "spacing", "horizontalScroll", "verticalScroll", "autoHide", "scrollX", "scrollY"] end if
  if contains(["Button", "Label", "Panel", "GroupBox", "StatusBar", "DatePicker"], typ) then return commonControlProps() + ["padding", "spacing"] end if
  return []
end function

function isControl(typ)
  return contains(["Label", "Button", "TextBox", "TextArea", "PasswordBox", "NumberBox", "CheckBox", "RadioButton", "Image", "Separator", "LinkLabel", "Panel", "ScrollViewer", "GroupBox", "ComboBox", "ListBox", "ScrollBar", "Slider", "ProgressBar", "TabControl", "MenuBar", "StatusBar", "ToolBar", "TreeView", "ListView", "Table", "DatePicker"], typ)
end function

function isContainerControl(typ)
  return contains(["Panel", "GroupBox", "TabControl", "ScrollViewer"], typ)
end function

function isLayout(typ)
  return contains(["VerticalStack", "HorizontalStack", "Grid", "Canvas", "DockPanel", "WrapPanel"], typ)
end function

function testControlProperties(result, path, typ, properties)
  if isNull(properties) then return end if
  testPropertyNames(result, path, properties, allowedControlProps(typ), typ + ".properties")
  if len(properties.keys) == 0 then return end if
  for i = 0 to len(properties.keys) - 1
    name = properties.keys[i]
    v = resourceValue(result, path, properties.values[i])
    if contains(["x", "y", "selectedIndex", "tabIndex", "row", "column", "rowSpan", "columnSpan"], name) and v.kind != "number" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer.") end if
    if contains(["width", "height"], name) then
      if v.kind != "number" and v.kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer, 'auto' or 'fill'.") end if
      if v.kind == "string" and v.text != "auto" and v.text != "fill" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer, 'auto' or 'fill'.") end if
    end if
    if contains(["minimum", "maximum", "value", "smallStep", "largeStep", "step", "decimals", "padding", "spacing", "minWidth", "minHeight", "maxWidth", "maxHeight", "fontSize", "borderWidth", "scrollX", "scrollY"], name) and v.kind != "number" then addError(result, path, "Property '" + name + "' on " + typ + " must be an integer.") end if
    if contains(["visible", "enabled", "fill", "readOnly", "visited", "horizontalScroll", "verticalScroll", "autoHide"], name) and v.kind != "bool" then addError(result, path, "Property '" + name + "' on " + typ + " must be a boolean.") end if
    if name == "checked" and v.kind != "bool" then addError(result, path, "Property '" + name + "' on " + typ + " must be a boolean.") end if
    if contains(["text", "placeholder", "orientation", "horizontalAlignment", "verticalAlignment", "alignment", "dock", "tooltip", "fontFamily", "fontWeight", "foreground", "background", "borderColor", "inputType", "validationMessage", "source", "stretch", "url"], name) and v.kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be a string.") end if
    if name == "orientation" and v.kind == "string" and v.text != "vertical" and v.text != "horizontal" then addError(result, path, "Property '" + name + "' on " + typ + " must be 'vertical' or 'horizontal'.") end if
    if name == "items" then
      if v.kind != "array" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of strings.")
      else if len(v.items) > 0 then
        for itemIndex = 0 to len(v.items) - 1
          if v.items[itemIndex].kind != "string" then addError(result, path, "Property '" + name + "' on " + typ + " must be an array of strings.") end if
        end for
      end if
    end if
  end for
end function

function idSeen(ids, id)
  return contains(ids, id)
end function

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
    testPropertyNames(result, path, prop(node, "properties"), ["spacing", "padding", "width", "height", "margin", "visible", "enabled", "columns", "orientation", "itemWidth", "itemHeight", "alignment", "dock", "fill", "minWidth", "minHeight", "maxWidth", "maxHeight"], typ + ".properties")
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
            ar = findFunctionArity(txt, result.events[evx].handler)
            if ar < 0 then addError(result, result.events[evx].path, "Event handler '" + result.events[evx].handler + "' was assigned to " + result.events[evx].controlType + " '" + result.events[evx].id + "', but no function was found in " + cbFull + ".")
            else if ar != 2 then addError(result, result.events[evx].path, "Event handler '" + result.events[evx].handler + "' must accept exactly 2 parameters: ui and event.")
            end if
          end for
        end if
      end if
    end if
  end if
  return result
end function

function controlDefaultHeight(typ)
  if typ == "MenuBar" then return 24 end if
  if typ == "ToolBar" then return 30 end if
  if typ == "StatusBar" then return 24 end if
  if typ == "Button" then return 30 end if
  if typ == "TextBox" then return 26 end if
  if typ == "TextArea" then return 80 end if
  if typ == "PasswordBox" then return 26 end if
  if typ == "NumberBox" then return 26 end if
  if typ == "CheckBox" or typ == "RadioButton" then return 22 end if
  if typ == "Image" then return 96 end if
  if typ == "Separator" then return 8 end if
  if typ == "LinkLabel" then return 24 end if
  if typ == "Panel" then return 120 end if
  if typ == "ScrollViewer" then return 160 end if
  if typ == "GroupBox" then return 80 end if
  if typ == "ComboBox" then return 120 end if
  if typ == "ListBox" then return 96 end if
  if typ == "ScrollBar" then return 100 end if
  if typ == "Slider" then return 32 end if
  if typ == "ProgressBar" then return 24 end if
  if typ == "TabControl" then return 160 end if
  if typ == "TreeView" then return 120 end if
  if typ == "ListView" or typ == "Table" then return 120 end if
  if typ == "DatePicker" then return 26 end if
  return 24
end function

function intProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "number" then return v.number end if
  return fallback
end function

function dimensionProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "number" then return v.number end if
  if v.kind == "string" and v.text == "fill" then return fallback end if
  if v.kind == "string" and v.text == "auto" then return fallback end if
  return fallback
end function

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

function stackSlotWidth(result, path, node, fallback)
  return clampDimension(result, path, node, "width", dimensionProp(result, path, node, "width", fallback))
end function

function layoutInt(node, name, fallback)
  v = prop(prop(node, "properties"), name)
  if v.kind == "number" then return v.number end if
  return fallback
end function

function boolProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "bool" then return v.flag end if
  return fallback
end function

function controlText(result, path, node)
  v = resourceValue(result, path, prop(prop(node, "properties"), "text"))
  if v.kind == "string" then return v.text end if
  return ""
end function

function stringProp(result, path, node, name, fallback)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind == "string" then return v.text end if
  return fallback
end function

function stringArrayLiteral(result, path, node, name)
  v = resourceValue(result, path, prop(prop(node, "properties"), name))
  if v.kind != "array" then return "[]" end if
  if len(v.items) == 0 then return "[]" end if
  parts = []
  for i = 0 to len(v.items) - 1
    parts = parts + [mlString(asString(v.items[i], ""))]
  end for
  return "[" + str.join(parts, ", ") + "]"
end function

function createCallFor(typ)
  if typ == "Label" then return "MiniGui.Label.create" end if
  if typ == "Button" then return "MiniGui.Button.create" end if
  if typ == "TextArea" then return "MiniGui.TextArea.create" end if
  if typ == "PasswordBox" then return "MiniGui.PasswordBox.create" end if
  if typ == "NumberBox" then return "MiniGui.NumberBox.create" end if
  if typ == "CheckBox" then return "MiniGui.CheckBox.create" end if
  if typ == "RadioButton" then return "MiniGui.RadioButton.create" end if
  if typ == "Image" then return "MiniGui.Image.create" end if
  if typ == "Separator" then return "MiniGui.Separator.create" end if
  if typ == "LinkLabel" then return "MiniGui.LinkLabel.create" end if
  if typ == "Panel" then return "MiniGui.Panel.create" end if
  if typ == "ScrollViewer" then return "MiniGui.ScrollViewer.create" end if
  if typ == "GroupBox" then return "MiniGui.GroupBox.create" end if
  if typ == "ComboBox" then return "MiniGui.ComboBox.create" end if
  if typ == "ListBox" then return "MiniGui.ListBox.create" end if
  if typ == "ScrollBar" then return "MiniGui.ScrollBar.create" end if
  if typ == "Slider" then return "MiniGui.Slider.create" end if
  if typ == "ProgressBar" then return "MiniGui.ProgressBar.create" end if
  if typ == "TabControl" then return "MiniGui.TabControl.create" end if
  if typ == "MenuBar" then return "MiniGui.MenuBar.create" end if
  if typ == "StatusBar" then return "MiniGui.StatusBar.create" end if
  if typ == "ToolBar" then return "MiniGui.ToolBar.create" end if
  if typ == "TreeView" then return "MiniGui.TreeView.create" end if
  if typ == "ListView" or typ == "Table" then return "MiniGui.ListView.create" end if
  if typ == "DatePicker" then return "MiniGui.DatePicker.create" end if
  return "MiniGui.TextBox.create"
end function

function addGeneratedNode(lines, fields, result, path, node, parentVar, x, y, width, height)
  typ = asString(prop(node, "type"), "")
  if isControl(typ) then
    id = asString(prop(node, "id"), "")
    if id == "" then id = "__" + typ + "_" + len(lines) end if
    var = miniIdent(id)
    w = dimensionProp(result, path, node, "width", width)
    h = dimensionProp(result, path, node, "height", controlDefaultHeight(typ))
    if boolProp(result, path, node, "fill", false) then w = width end if
    dock = stringProp(result, path, node, "dock", "")
    if dock == "fill" then
      w = width
      h = height
    end if
    align = stringProp(result, path, node, "alignment", stringProp(result, path, node, "horizontalAlignment", "fill"))
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
    if typ == "CheckBox" or typ == "RadioButton" then
      checked = "false"
      if boolProp(result, path, node, "checked", false) then checked = "true" end if
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + checked + ")"]
    else if typ == "NumberBox" then
      numberMin = intProp(result, path, node, "minimum", 0)
      numberMax = intProp(result, path, node, "maximum", 100)
      numberValue = intProp(result, path, node, "value", numberMin)
      numberStep = intProp(result, path, node, "step", 1)
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + numberMin + ", " + numberMax + ", " + numberValue + ", " + numberStep + ")"]
    else if typ == "Image" then
      source = stringProp(result, path, node, "source", "")
      stretch = stringProp(result, path, node, "stretch", "none")
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(source) + ", " + mlString(stretch) + ")"]
    else if typ == "Separator" then
      sepOrientation = stringProp(result, path, node, "orientation", "horizontal")
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(sepOrientation) + ")"]
    else if typ == "LinkLabel" then
      url = stringProp(result, path, node, "url", "")
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(url) + ")"]
    else if typ == "ScrollViewer" then
      hscroll = "false"
      vscroll = "true"
      if boolProp(result, path, node, "horizontalScroll", false) then hscroll = "true" end if
      if boolProp(result, path, node, "verticalScroll", true) == false then vscroll = "false" end if
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + hscroll + ", " + vscroll + ")"]
    else if typ == "ComboBox" or typ == "ListBox" or typ == "ListView" or typ == "Table" then
      items = stringArrayLiteral(result, path, node, "items")
      selectedIndex = intProp(result, path, node, "selectedIndex", -1)
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + items + ", " + selectedIndex + ")"]
    else if typ == "TabControl" then
      itemsTab = stringArrayLiteral(result, path, node, "items")
      selectedTab = intProp(result, path, node, "selectedIndex", 0)
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + itemsTab + ", " + selectedTab + ")"]
    else if typ == "MenuBar" or typ == "ToolBar" or typ == "TreeView" then
      itemsText = stringArrayLiteral(result, path, node, "items")
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + itemsText + ")"]
    else if typ == "ScrollBar" or typ == "Slider" then
      defaultOrientation = "vertical"
      if typ == "Slider" then defaultOrientation = "horizontal" end if
      orientation = stringProp(result, path, node, "orientation", defaultOrientation)
      minimum = intProp(result, path, node, "minimum", 0)
      maximum = intProp(result, path, node, "maximum", 100)
      value = intProp(result, path, node, "value", minimum)
      smallStep = intProp(result, path, node, "smallStep", 1)
      largeStep = intProp(result, path, node, "largeStep", 10)
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + mlString(orientation) + ", " + minimum + ", " + maximum + ", " + value + ", " + smallStep + ", " + largeStep + ")"]
    else if typ == "ProgressBar" then
      progressMin = intProp(result, path, node, "minimum", 0)
      progressMax = intProp(result, path, node, "maximum", 100)
      progressValue = intProp(result, path, node, "value", progressMin)
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ", " + progressMin + ", " + progressMax + ", " + progressValue + ")"]
    else
      lines = lines + [var + " = " + createCallFor(typ) + "(app, " + parentVar + ", " + mlString(id) + ", " + mlString(controlText(result, path, node)) + ", " + x + ", " + y + ", " + w + ", " + h + ")"]
    end if
    if boolProp(result, path, node, "enabled", true) == false then lines = lines + ["MiniGui.Control.setEnabled(" + var + ", false)"] end if
    if boolProp(result, path, node, "visible", true) == false then lines = lines + ["MiniGui.Control.setVisible(" + var + ", false)"] end if
    if boolProp(result, path, node, "readOnly", false) then lines = lines + ["MiniGui.Control.setReadOnly(" + var + ", true)"] end if
    maxLength = intProp(result, path, node, "maxLength", -1)
    if maxLength >= 0 then lines = lines + ["MiniGui.Control.setMaxLength(" + var + ", " + maxLength + ")"] end if
    if contains(fields, var) == false then fields = fields + [var] end if
    if isContainerControl(typ) then
      childPadding = intProp(result, path, node, "padding", 8)
      childSpacing = intProp(result, path, node, "spacing", 6)
      childY = childPadding
      if typ == "GroupBox" then childY = childPadding + 14 end if
      if typ == "TabControl" then childY = childPadding + 30 end if
      childNodes = arrItems(prop(node, "children"))
      if len(childNodes) > 0 then
        for childIndex = 0 to len(childNodes) - 1
          childType = asString(prop(childNodes[childIndex], "type"), "")
          childX = childPadding
          childSlotY = childY
          childSlotH = controlDefaultHeight(childType)
          if typ == "TabControl" then
            childSlotH = h - childY - childPadding
            if childSlotH < 1 then childSlotH = controlDefaultHeight(childType) end if
          end if
          rChild = addGeneratedNode(lines, fields, result, path, childNodes[childIndex], var, childX, childSlotY, w - childPadding * 2, childSlotH)
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
  if typ == "HorizontalStack" then
    cx = x + padding
    maxh = 0
    for i = 0 to len(children) - 1
      slotW = stackSlotWidth(result, path, children[i], 120)
      r = addGeneratedNode(lines, fields, result, path, children[i], parentVar, cx, y + padding, slotW, height - padding * 2)
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
      rg = addGeneratedNode(lines, fields, result, path, children[gi], parentVar, gx, cyg, cellW, childHGrid)
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
      rd = addGeneratedNode(lines, fields, result, path, child, parentVar, dx, dy, dw, dh)
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
      rwc = addGeneratedNode(lines, fields, result, path, childWrap, parentVar, wx, wy, ww, wh)
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
      r2 = addGeneratedNode(lines, fields, result, path, children[c], parentVar, cx2, cy2, width, controlDefaultHeight(asString(prop(children[c], "type"), "")))
      lines = r2[0]; fields = r2[1]
      bottom = (cy2 - y) + r2[2]
      if bottom > maxb then maxb = bottom end if
    end for
    return [lines, fields, maxb]
  end if
  cy = y + padding
  usedTotal = padding
  for j = 0 to len(children) - 1
    r3 = addGeneratedNode(lines, fields, result, path, children[j], parentVar, x + padding, cy, width - padding * 2, controlDefaultHeight(asString(prop(children[j], "type"), "")))
    lines = r3[0]; fields = r3[1]
    cy = cy + r3[2] + spacing
    usedTotal = usedTotal + r3[2] + spacing
  end for
  if len(children) > 0 then usedTotal = usedTotal - spacing end if
  return [lines, fields, usedTotal + padding]
end function

function generateCode(result, outputPath)
  entryDoc = result.entryDocument
  ns = asString(prop(entryDoc, "namespace"), "minigui_app")
  uiType = miniGuiTypeName(ns) + "Ui"
  outFull = normalizePath(outputPath)
  ensureDir(dirname(outFull))
  cbRel = relativePath(dirname(outFull), result.codeBehindPath)
  fields = ["app"]
  body = ["// Generated from " + result.entryPath, "app = MiniGui.Application.create()", "miniguiWindowProcPtr = nativeCallback(miniguiWindowProc, \"wndproc\")", "miniguiTimerProcPtr = nativeCallback(miniguiTimerProc, \"wndproc\")"]
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
    body = body + ["", "// Window '" + wid + "' from " + path, wid + " = MiniGui.Window.create(app, " + mlString(wid) + ", " + mlString(title) + ", " + ww + ", " + wh + ")", "MiniGui.Window.installProc(" + wid + ", miniguiWindowProcPtr)", "MiniGui.Window.startResizeTimer(" + wid + ", miniguiTimerProcPtr)"]
    if contains(fields, wid) == false then fields = fields + [wid] end if
    r = addGeneratedNode(body, fields, result, path, prop(w, "layout"), wid, 0, 0, ww - 40, wh - 80)
    body = r[0]; fields = r[1]
  end for
  body = body + ["", "ui = " + uiType + "(" + str.join(fields, ", ") + ")"]
  wrappers = []
  for e = 0 to len(result.events) - 1
    ev = result.events[e]
    cid = miniIdent(ev.id)
    wrapper = "miniguiEvent" + e
    wrappers = wrappers + [[wrapper, ev.handler]]
    if ev.eventName == "load" then body = body + ["MiniGui.Events.bindLoad(app, " + cid + ", " + wrapper + ", ui)"]
    else if ev.eventName == "close" then body = body + ["MiniGui.Events.bindClose(app, " + cid + ", " + wrapper + ", ui)"]
    else if ev.eventName == "resized" then body = body + ["MiniGui.Events.bindResized(app, " + cid + ", " + wrapper + ", ui)"]
    else if ev.eventName == "click" or ev.eventName == "clicked" then body = body + ["MiniGui.Events.bindClick(app, " + cid + ", " + wrapper + ", ui)"]
    else if ev.eventName == "selectionChanged" or ev.eventName == "selected" then body = body + ["MiniGui.Events.bindSelectionChanged(app, " + cid + ", " + wrapper + ", ui)"]
    else if ev.eventName == "scrollChanged" then body = body + ["MiniGui.Events.bindScrollChanged(app, " + cid + ", " + wrapper + ", ui)"]
    else if ev.eventName == "valueChanged" then
      if ev.controlType == "NumberBox" then body = body + ["MiniGui.Events.bindChange(app, " + cid + ", " + wrapper + ", ui)"]
      else body = body + ["MiniGui.Events.bindScrollChanged(app, " + cid + ", " + wrapper + ", ui)"]
      end if
    else if ev.eventName == "change" or ev.eventName == "changed" or ev.eventName == "submit" or ev.eventName == "validating" or ev.eventName == "validated" then body = body + ["MiniGui.Events.bindChange(app, " + cid + ", " + wrapper + ", ui)"]
    else body = body + ["MiniGui.Events.bindTextChanged(app, " + cid + ", " + wrapper + ", ui)"]
    end if
  end for
  startup = miniIdent(asString(prop(prop(entryDoc, "application"), "startupWindow"), ""))
  if startup == "_" and len(result.windows) > 0 then startup = miniIdent(asString(prop(result.windows[0].window, "id"), "window")) end if
  body = body + ["MiniGui.Application.setStartupWindow(app, " + startup + ")", "MiniGui.Window.show(" + startup + ")", "return MiniGui.Application.run(app)"]
  lines = ["// <auto-generated> MiniGui generated code. Do not edit by hand.", "import MiniGuiLib.minigui as MiniGui", "import " + mlString(cbRel) + " as CodeBehind", "", "struct " + uiType]
  for f = 0 to len(fields) - 1
    lines = lines + ["  " + fields[f] + ","]
  end for
  lines = lines + ["end struct", ""]
  lines = lines + ["function miniguiWindowProc(hwnd, msg, wParam, lParam)", "  return MiniGui.Application.windowProc(hwnd, msg, wParam, lParam)", "end function", ""]
  lines = lines + ["function miniguiTimerProc(hwnd, msg, wParam, lParam)", "  return MiniGui.Application.timerProc(hwnd, msg, wParam, lParam)", "end function", ""]
  for widx = 0 to len(wrappers) - 1
    lines = lines + ["function " + wrappers[widx][0] + "(ui, event)", "  return CodeBehind." + wrappers[widx][1] + "(ui, event)", "end function", ""]
  end for
  lines = lines + ["function main(args)"]
  for b = 0 to len(body) - 1
    if body[b] == "" then lines = lines + [""]
    else lines = lines + ["  " + body[b]]
    end if
  end for
  lines = lines + ["end function"]
  ok = fs.writeAllText(outFull, str.join(lines, "\n") + "\n")
  if typeof(ok) == "error" then return ok end if
  return outFull
end function

function parseOptions(args, start)
  opts = [["output", ""], ["codeBehind", ""], ["generatedDir", ""], ["compiler", "..\\MiniLangCompilerML\\build\\mlc_win64.exe"], ["libraryDir", "."], ["noCompile", "false"], ["keepGenerated", "false"]]
  includes = []
  i = start
  while i < len(args)
    a = args[i]
    if a == "--output" then i = i + 1; opts[0][1] = args[i]
    else if a == "--code-behind" then i = i + 1; opts[1][1] = args[i]
    else if a == "--generated-dir" then i = i + 1; opts[2][1] = args[i]
    else if a == "--compiler" then i = i + 1; opts[3][1] = args[i]
    else if a == "--library-dir" then i = i + 1; opts[4][1] = args[i]
    else if a == "--include-dir" then i = i + 1; includes = includes + [normalizePath(args[i])]
    else if a == "--no-compile" then opts[5][1] = "true"
    else if a == "--keep-generated" then opts[6][1] = "true"
    else if a == "--verbose" or a == "--debug" or a == "--release" then
      // accepted for compatibility
    else
      return error(2, "Unknown option: " + a)
    end if
    i = i + 1
  end while
  return [opts, includes]
end function

function opt(opts, name)
  for i = 0 to len(opts) - 1
    if opts[i][0] == name then return opts[i][1] end if
  end for
  return ""
end function

function usage()
  print "Usage:"
  print "  minigui validate <app.mson> [--include-dir <dir>] [--code-behind <file>]"
  print "  minigui generate <app.mson> --output <app.gui.ml>"
  print "  minigui build <app.mson> --output <app.exe> [--no-compile]"
end function

function compilerCommand(compiler, generated, outExe, libraryDir)
  base = q(compiler)
  if str.endsWith(compiler, ".py") or str.endsWith(compiler, ".PY") then
    base = "py -3.14 " + q(compiler)
  end if
  return base + " " + q(generated) + " " + q(outExe) + " -I " + q(libraryDir) + " --subsystem gui"
end function

function writeValidation(result)
  if len(result.errors) > 0 then
    for i = 0 to len(result.errors) - 1
      print result.errors[i]
    end for
    return false
  end if
  return true
end function

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
  if outExe == "" then outExe = joinPath(dirname(normalizePath(msonPath)), "build\\app.exe") end if
  ensureDir(dirname(outExe))
  cmd = compilerCommand(opt(opts, "compiler"), generated, outExe, opt(opts, "libraryDir"))
  rc = _wsystem(cmd)
  if rc != 0 then return rc end if
  print "Built: " + normalizePath(outExe)
  return 0
end function
