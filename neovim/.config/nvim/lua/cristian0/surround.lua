local status_ok, surround = pcall(require, "surround")
if not status_ok then
	return
end
  surround.config = function()
    require"surround".setup {mappings_style = "surround"}
  end
