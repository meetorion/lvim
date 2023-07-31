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

-- -- Additional Plugins
table.insert(lvim.plugins, {
    {
        "p00f/clangd_extensions.nvim",
        after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
        config = function()
            local provider = "clangd"
            local clangd_flags = {
                -- 在后台自动分析文件（基于complie_commands)
                "--compile-commands-dir=build",
                "--background-index",
                "--completion-style=detailed",
                -- 同时开启的任务数量
                "--all-scopes-completion=true",
                "--recovery-ast",
                "--suggest-missing-includes",
                -- 告诉clangd用那个clang进行编译，路径参考which clang++的路径
                "--query-driver=/usr/locla/bin/clang++,/usr/bin/g++",
                "--clang-tidy",
                -- 全局补全（会自动补充头文件）
                "--all-scopes-completion",
                "--cross-file-rename",
                -- 更详细的补全内容
                "--completion-style=detailed",
                "--function-arg-placeholders=false",
                -- 补充头文件的形式
                "--header-insertion=never",
                -- pch优化的位置
                "--pch-storage=memory",
                "--offset-encoding=utf-16",
                "-j=12",
            }

            local custom_on_attach = function(client, bufnr)
                require("lvim.lsp").common_on_attach(client, bufnr)
                require("clangd_extensions.inlay_hints").setup_autocmd()
                require("clangd_extensions.inlay_hints").set_inlay_hints()
            end


            local custom_on_init = function(client, bufnr)
                require("lvim.lsp").common_on_init(client, bufnr)
                require("clangd_extensions.config").setup {}
                require("clangd_extensions.ast").init()
                vim.cmd [[
              command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
              command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
              command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
              command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
              command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
              ]]
            end

            local opts = {
                cmd = { provider, unpack(clangd_flags) },
                on_attach = custom_on_attach,
                on_init = custom_on_init,
            }

            require("lvim.lsp.manager").setup("clangd", opts)
        end
    },
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

-- some settings can only passed as commandline flags, see `clangd --help`
local clangd_flags = {
    "--background-index",
    "--fallback-style=Google",
    "--all-scopes-completion",
    "--clang-tidy",
    "--log=error",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--pch-storage=memory",     -- could also be disk
    "--folding-ranges",
    "--enable-config",          -- clangd 11+ supports reading from .clangd configuration file
    "--offset-encoding=utf-16", --temporary fix for null-ls
    -- "--limit-references=1000",
    -- "--limit-resutls=1000",
    -- "--malloc-trim",
    -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
    -- "--header-insertion=never",
    -- "--query-driver=<list-of-white-listed-complers>"
}

local provider = "clangd"

local custom_on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)

    local opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
    vim.keymap.set("x", "<leader>lA", "<cmd>ClangdAST<cr>", opts)
    vim.keymap.set("n", "<leader>lH", "<cmd>ClangdTypeHierarchy<cr>", opts)
    vim.keymap.set("n", "<leader>lt", "<cmd>ClangdSymbolInfo<cr>", opts)
    vim.keymap.set("n", "<leader>lm", "<cmd>ClangdMemoryUsage<cr>", opts)

    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
end

local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
    clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

local custom_on_init = function(client, bufnr)
    require("lvim.lsp").common_on_init(client, bufnr)
    require("clangd_extensions.config").setup {}
    require("clangd_extensions.ast").init()
    vim.cmd [[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]]
end

local opts = {
    cmd = { provider, unpack(clangd_flags) },
    on_attach = custom_on_attach,
    on_init = custom_on_init,
}

require("lvim.lsp.manager").setup("clangd", opts)



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
