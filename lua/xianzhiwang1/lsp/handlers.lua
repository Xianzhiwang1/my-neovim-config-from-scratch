local lsp = vim.lsp

local M = {}

M.setup = function()
    lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    lsp.handlers["textDocument/signatureHelp"] = lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    })
    vim.diagnostic.config({
        float = {
            source = 'always',
            border = "rounded"
        },
    })
end

return M
