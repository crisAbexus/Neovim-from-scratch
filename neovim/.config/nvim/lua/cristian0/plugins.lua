local fn = vim.fn
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
end)
-- Automatically install packer

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function()
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  -- Colorschemes
  use { "ellisonleao/gruvbox.nvim" }
  use { "rockyzhang24/arctic.nvim", requires = { "rktjmp/lush.nvim" } }
  use 'folke/tokyonight.nvim'

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "p00f/nvim-ts-rainbow" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use "moll/vim-bbye"
  use 'nvim-lualine/lualine.nvim'

  use "rktjmp/lush.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "windwp/nvim-ts-autotag"

  -- snippets
  --[[ use "L3MON4D3/LuaSnip" --snippet engine ]]
  use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  use { 'dsznajder/vscode-es7-javascript-react-snippets',
    run = 'yarn install --frozen-lockfile && yarn compile'
  }

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim" -- tailwind helper
  use "williamboman/mason-lspconfig.nvim"
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "BurntSushi/ripgrep",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    }
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use 'tpope/vim-fugitive'

  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() fn["mkdp#util#install"]() end,
  })

  --[[ use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }) ]]
  -- nvim-tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  -- Lua
  --use {
  -- "narutoxy/dim.lua",
  -- requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
  --config = function()
  -- require('dim').setup({})
  --end
  --}

  use {
    'salkin-mada/openscad.nvim',
    config = function()
      require('openscad')
      -- load snippets, note requires
      vim.g.openscad_load_snippets = true
    end,
    requires = 'L3MON4D3/LuaSnip'
  }

  -- packer.nvim
  use 'lervag/vimtex'

  use "lukas-reineke/indent-blankline.nvim"
  use { 's1n7ax/nvim-window-picker', tag = "v1.*" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      's1n7ax/nvim-window-picker',
    },
  }
  use { 'thibthib18/mongo-nvim', rocks = { 'lua-mongo' } }
  use {
    "NTBBloodbath/rest.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
end)
