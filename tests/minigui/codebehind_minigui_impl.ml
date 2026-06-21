package codebehind_minigui_impl

import MiniGuiLib.minigui as MiniGui

function setLabel(ui, event)
  MiniGui.Control.setText(ui.resultLabel, "ok")
  return 0
end function
