local status_ok, surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end
surround.config = function()
  require "surround".setup()
end
