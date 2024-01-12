local success, _ = pcall(require, "lspconfig")
if not success then
  print("WARNING: lspconfig not loaded.")
  return
end

-- Not sure what handlers do.
require("xianzhiwang1.lsp.handlers").setup()
require("xianzhiwang1.lsp.lsp-installer")
