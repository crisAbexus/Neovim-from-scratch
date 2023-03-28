-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- floating terminal
-- local Util = require("lazyvim.util")
-- local term_borders = Util.float_term
-- local term_borders = '<cmd>lua require("lazyvim.util").float_term(nil, { cwd = require("lazyvim.util").get_root(), border= "single" })<CR>'
--
-- vim.keymap.set("n", "<leader>ft", term_borders, {})
local Util = require("lazyvim.util")
vim.keymap.set(
  "n",
  "<leader>ft",
  function()
    Util.float_term(nil, { cwd = Util.get_root(), border= "single" })
  end,
  { noremap = true, silent = true, desc = "Resume" }
)
