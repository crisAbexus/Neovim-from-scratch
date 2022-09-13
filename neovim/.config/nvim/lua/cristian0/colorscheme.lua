local colorscheme = "arctic"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.o.background = "dark" -- or "light" for light mode

-- In cool_name/lua/lush_theme/cool_name.lua

-- require lush
