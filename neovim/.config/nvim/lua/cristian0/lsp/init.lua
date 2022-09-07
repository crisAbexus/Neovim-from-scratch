local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "cristian0.lsp.lsp-installer"
require("cristian0.lsp.handlers").setup()
require "cristian0.lsp.null-ls"
