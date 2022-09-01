require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
--[[ require "user.nvim-tree" ]]
require "user.bufferline"
require "user.lualine"
<<<<<<< HEAD:init.lua
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
=======
require "user.indent"
require("luasnip/loaders/from_vscode").load({paths = "~/.config/nvim/snippets/"})
>>>>>>> manjaro-changes:neovim/.config/nvim/init.lua
