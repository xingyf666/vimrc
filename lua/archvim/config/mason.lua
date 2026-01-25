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

require("mason-lspconfig").setup {
    ensure_installed = lsp_list,
    automatic_installation = true,
    automatic_enable = true,
}

vim.lsp.config("*", {
    capabilities = vim.lsp.protocol.make_client_capabilities()
})

vim.lsp.enable(lsp_list)
