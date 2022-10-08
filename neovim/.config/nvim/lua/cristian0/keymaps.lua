local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "ñ", "<Nop>", opts)
vim.g.mapleader = "ñ"
vim.g.maplocalleader = "ñ"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts);
keymap("n", "<C-j>", "<C-w>j", opts);
keymap("n", "<C-k>", "<C-w>k", opts);
keymap("n", "<C-l>", "<C-w>l", opts);

--[[ keymap("n", "<leader>e", ":Lex 30<cr>", opts) ]]

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts);
keymap("n", "<C-Down>", ":resize +2<CR>", opts);
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts);
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts);

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts);
keymap("n", "<S-h>", ":bprevious<CR>", opts);

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts);
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts);

-- Insert Mode --
-- Press jk fast to enter
--[[ keymap("i", "jk", "<ESC>", opts) ]]

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts);
keymap("v", ">", ">gv", opts);

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts);
keymap("v", "<A-k>", ":m .-2<CR>==", opts);
keymap("v", "p", '"_dP', opts);

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts);
keymap("x", "K", ":move '<-2<CR>gv-gv", opts);
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts);
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts);

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts);
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts);
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts);
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts);

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<c-g>",
  "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts);
keymap("n", "<c-f>", "<cmd>Telescope live_grep<cr>", opts);

-- Nvimtree
keymap("n", "¿e", ":Neotree toggle<cr>", opts);
keymap("n", "ñe", ":Neotree toggle<cr>", opts);

-- buffers
-- Close buffer
keymap("n", "¿q", ":Bdelete<CR>", opts);
keymap("n", "ñq", ":Bdelete<CR>", opts);

-- Close pane
keymap("n", "ñx", ":clo<CR>", opts);
keymap("n", "¿x", ":clo<CR>", opts);
keymap("n", "ñ|", "<C-w>v", opts);
keymap("n", "<leader>-", "<C-w>s", opts);
keymap("n", "ñ0", "<cmd>noh<cr>", opts);
keymap("n", "ñpwd", "<cmd>echo @%<cr>", opts);

-- REST API
keymap("n", "¿rr", "<cmd>lua require('rest-nvim').run()<cr>", opts);

-- luasnip
local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-p>", function()
  if ls.expand_or_jumpable() then
    ls.expand()
  end
end)

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(1) then
    ls.jump(1)
  end
end)

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end)

vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

vim.keymap.set({ "i", "s" }, "<c-h>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end)
keymap("i", "<C-a>", "<home>", opts);
keymap("i", "<C-e>", "<end>", opts);

--[[ keymap("c", "<C-a>", "<C-home>", opts); ]]
keymap("c", "<C-j>", "<C-n>", opts);
keymap("c", "<C-k>", "<C-p>", opts);
