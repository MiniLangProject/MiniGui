import MiniGuiLib.minigui as MiniGui

function main(args)
  if MiniGui._normalizeEditText("") != "" then return 1 end if

  app = MiniGui.Application.create()
  if MiniGui.Events.findWindowByHandle(app, 12345) is void == false then return 2 end if
  if MiniGui.Events.dispatchClose(app, void) then return 3 end if
  if MiniGui.Events.dispatchResize(app, void, 0, 1) then return 4 end if
  if MiniGui.Events.dispatchControlTextBindings(app, void, "changed", "", "") then return 5 end if
  if MiniGui.Events.dispatchNotify(app, 0, 0, 0, 0) then return 6 end if
  if MiniGui.Events.dispatchClickByHandle(app, 0, 0) then return 7 end if
  if MiniGui.Events.dispatchTabChangedByHandle(app, 0) then return 8 end if
  if MiniGui.Events.dispatchScroll(app, 0, 0, 0) then return 9 end if
  if MiniGui.Events.dispatchCommand(app, 0, 0, 0) then return 10 end if
  if MiniGui.Events.dispatchCommand(app, 768, 0, 0) then return 11 end if
  if MiniGui.Events.dispatchCommand(app, 1, 0, 0) then return 12 end if

  window = MiniGui.Window.create(app, "emptyStateWindow", "Empty state smoke", 240, 120)
  if MiniGui.Events.dispatchLoad(window) then return 13 end if
  if MiniGui.Events.dispatchScrollViewer(app, 0, 0, 0) then return 14 end if
  MiniGui.DestroyWindow(window.handle)
  MiniGui._releaseRuntimeResources()
  return 0
end function
