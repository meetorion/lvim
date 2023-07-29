require('go').setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

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

local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
    return
end

dapgo.setup()

-- vista.vim插件问题修复
vim.g['vista#renderer#enable_icon'] = 0
vim.g.vista_executive_for = {
    go = 'nvim_lsp',
}
