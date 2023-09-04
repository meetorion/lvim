------------------------
-- Treesitter
------------------------
lvim.builtin.treesitter.ensure_installed = {
    "go",
    "gomod",
}

------------------------
-- Formatting
-- ------------------------
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--     { command = "goimports", filetypes = { "go" } },
--     -- { command = "gofumpt",   filetypes = { "go" } },
-- }

-- lvim.format_on_save = {
--     enabled = false,
--     pattern = { "*.go" },
-- }

-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        require('go.format').goimport()
    end,
    group = format_sync_grp,
})

------------------------
-- Dap
------------------------
local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
    return
end

dapgo.setup()

------------------------
-- LSP
------------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("golangci_lint_ls", {
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
    on_attach = function(client, bufnr)
        require("lvim.lsp").common_on_attach(client, bufnr)
        local _, _ = pcall(vim.lsp.codelens.refresh)
        local map = function(mode, lhs, rhs, desc)
            if desc then
                desc = desc
            end

            vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
        end
        map("n", "<leader>Ci", "<cmd>GoInstallDeps<Cr>", "Install Go Dependencies")
        map("n", "<leader>Ct", "<cmd>GoMod tidy<cr>", "Tidy")
        map("n", "<leader>Ca", "<cmd>GoTestAdd<Cr>", "Add Test")
        map("n", "<leader>CA", "<cmd>GoTestsAll<Cr>", "Add All Tests")
        map("n", "<leader>Ce", "<cmd>GoTestsExp<Cr>", "Add Exported Tests")
        map("n", "<leader>Cg", "<cmd>GoGenerate<Cr>", "Go Generate")
        map("n", "<leader>Cf", "<cmd>GoGenerate %<Cr>", "Go Generate File")
        map("n", "<leader>Cc", "<cmd>GoCmt<Cr>", "Generate Comment")
        map("n", "<leader>DT", "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test")
    end,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = require("lvim.lsp").common_capabilities(),
    settings = {
        gopls = {
            usePlaceholders = true,
            gofumpt = true,
            codelenses = {
                generate = false,
                gc_details = true,
                test = true,
                tidy = true,
            },
        },
    },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
    return
end

gopher.setup {
    commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
    },
}

-- require('go').setup()
-- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- local status_ok, which_key = pcall(require, "which-key")
-- if not status_ok then
--     return
-- end

-- local opts = {
--     mode = "n",     -- NORMAL mode
--     prefix = "<leader>",
--     buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true,  -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true,  -- use `nowait` when creating keymaps
-- }

-- vista.vim插件问题修复
vim.g['vista#renderer#enable_icon'] = 0
vim.g.vista_executive_for = {
    go = 'nvim_lsp',
}
