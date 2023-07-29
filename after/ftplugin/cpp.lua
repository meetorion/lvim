require("lspconfig").clangd.setup({
    capabilities = {
        offsetEncoding = { "utf-16" }
    }
})

lvim.format_on_save = true
-- lvim.lsp.diagnostics.virtual_text = true
vim.diagnostic.config({
    virtual_text = true
})

lvim.builtin.treesitter.highlight.enable = true

-- auto install treesitter parsers
lvim.builtin.treesitter.ensure_installed = { "cpp", "c" }


local dap = require("dap")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = 'executable',
    command = "/home/leejoy/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,

        cwd = "${workspaceFolder}",
        stopAtEntry = true,
    },
}
dap.configurations.c = dap.configurations.cpp
