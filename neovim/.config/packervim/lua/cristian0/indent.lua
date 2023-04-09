vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#2E7F18 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#00FFFF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#675E24 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#FFC300 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#800080 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#FFC0CB gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent7 guifg=#C82538 gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space: ")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
        "IndentBlanklineIndent7",
    },
    show_current_context = true,
    show_current_context_start = true,
}
