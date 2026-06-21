import "codebehind_alias_impl.ml" as CodeBehind

struct Box
  value,
end struct

function main(args)
  box = Box("")
  CodeBehind.setValue(box, void)
  if box.value != "ok" then return 1 end if
  return 0
end function
