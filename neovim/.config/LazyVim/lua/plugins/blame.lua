return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gbb", function()
      local bufname = vim.fn.bufname("%")
      if string.find(bufname, "fugitiveblame") then
        return "<CMD>clo<CR>"
      else
        return "<CMD>Git blame<CR>"
      end
    end, { expr = true })
    vim.keymap.set("n", "<leader>gbl", "<cmd> Git blame_line<CR>", { noremap = true })
  end,
}
