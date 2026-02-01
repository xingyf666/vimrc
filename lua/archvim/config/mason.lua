require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lsp_list = { "clangd", "pyright", "lua_ls" }
if os.getenv("ARCHIBATE_COMPUTER") then
    lsp_list = { "clangd", "pyright", "lua_ls", "ts_ls", "fish_lsp", "cmake", "rust_analyzer", "arduino_language_server", "jsonls", "bashls", "sqlls" }
end

require("mason-lspconfig").setup {
    ensure_installed = lsp_list,
    automatic_installation = false,
    automatic_enable = true,
}

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities()
})

vim.lsp.enable(lsp_list)
