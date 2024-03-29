lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["r"] = { "<cmd>Jaq<CR>", "Jaq" }

-- trouble mappings
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
}


-- -- go mappings
lvim.builtin.which_key.mappings["v"] = {
    name = "go",
    a = { "<cmd>GoAddTag<cr>", "GoAddTags" },
    r = { "<cmd>GoRmTag<cr>", "GoRmTag" },
    c = { "<cmd>GoClearTag<cr>", "GoClearTag" },
    e = { "<cmd>GoIfErr<cr>", "GoIfErr" },
    m = { "<cmd>GoMockGen<cr>", "GoMockGen" },
    t = { "<cmd>GoTest<cr>", "GoTest" },
    T = { "<cmd>GoTestFunc<cr>", "GoTestFunc" },
    i = { "<cmd>GoImpl<cr>", "GoImpl" },
    f = { "<cmd>GoFillStruct<cr>", "GoFillStruct" },
}

lvim.builtin.which_key.mappings["m"] = {
    name = "more",
    e = { "<cmd>Vista<cr>", "Vista" },
    c = { "<cmd>ChatGPT<cr>", "ChatGPT" },
    -- c = { "<cmd>Copilot panel<cr>", "Copilot" },
    v = { "<cmd>vsplit<cr>", "Vsplit" },
    f = { "<cmd>HopWord<cr>", "HopWord" },
}

-- neotest快捷键
lvim.builtin.which_key.mappings["N"] = {
    name = "neotest",
    n = { "<cmd>lua require'neotest'.run.run()<cr>", "nearest test" },
    f = { "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>", "current file" },
    d = { "<cmd>lua require'neotest'.run.run({strategy = 'dap'})<cr>", "debug nearest test" },
    s = { "<cmd>lua require'neotest'.run.run(vim.fn.getcwd())<cr>", "suite" },
    a = { "<cmd>lua require'neotest'.run.attach()<cr>", "attach nearest test" },
}

-- 终端插件floaterm快捷键
lvim.builtin.which_key.mappings["o"] = {
    name = "+open",
    i = { "<cmd>NeoAI<cr>", "NeoAI" },
    c = { "<cmd>NeoAIContext<cr>", "NeoAIContext" },
    a = { "<cmd>FloatermNew --wintype=popup --height=6<cr>", "terminal" },
    f = { "<cmd>FloatermNew fzf<cr>", "fzf" },
    g = { "<cmd>FloatermNew lazygit<cr>", "lazygit" },
    d = { "<cmd>FloatermNew lazydocker<cr>", "lazydocker" },
    -- n = { "<cmd>FloatermNew node<cr>", "node" },
    n = { ":lua require'impulse'.menu_search()<cr>", "Notion" },
    N = { "<cmd>FloatermNew nnn<cr>", "nnn" },
    p = { "<cmd>FloatermNew python<cr>", "python" },
    r = { "<cmd>FloatermNew ranger<cr>", "ranger" },
    t = { "<cmd>FloatermToggle<cr>", "toggle" },
    y = { "<cmd>FloatermNew ytop<cr>", "ytop" },
    s = { "<cmd>FloatermNew ncdu<cr>", "ncdu" },
}

--翻译插件Translate快捷键
lvim.keys.visual_mode["<C-v>"] = "<cmd>TranslateW<cr>"
lvim.builtin.which_key.mappings["F"] = {
    name = "+Translate",
    w = { ":TranslateW<cr>", "window" },
    l = { ":Translate<cr>", "cmdline" },
    r = { ":TranslateR<cr>", "replace" },
    c = { ":TranslateX", "clipboard" },
}

-- 显示或隐藏调试界面
lvim.keys.normal_mode["<C-u>"] = "<cmd>lua require'dapui'.toggle()<cr>"

--debug
lvim.keys.normal_mode["<F4>"] = "<cmd>lua require'dap'.toggle_breakpoint()<cr>"
lvim.keys.normal_mode["<F5>"] = "<cmd>lua require'dap'.start()<cr>"
lvim.keys.normal_mode["<F6>"] = "<cmd>lua require'dap'.run_to_cursor()<cr>"
lvim.keys.normal_mode["<F9>"] = "<cmd>lua require'dap'.repl.toggle()<cr>"
lvim.keys.normal_mode["<F8>"] = "<cmd>lua require'dap'.step_over()<cr>"
lvim.keys.normal_mode["<F7>"] = "<cmd>lua require'dap'.step_into()<cr>"
lvim.keys.normal_mode["<F10>"] = "<cmd>lua require'dap'.step_out()<cr>"
lvim.keys.normal_mode["<C-i>"] = "<cmd>lua require'dapui'.eval()<cr>"

-- 代码解释
lvim.keys.visual_mode["<C-k>"] = ":CodeExplain<cr>"

-- TodoComments快捷键
lvim.builtin.which_key.mappings["T"] = {
    name = "+TodoComments",
    l = { ":TodoLocList<cr>", "Locklist" },
    f = { ":TodoQuickFix<cr>", "QuickFix" },
    s = { ":TodoTelescope<cr>", "Telescope" },
    t = { ":TodoTrouble", "Trouble" },
}

-- go to preview
vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })
vim.keymap.set("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { noremap = true })
vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true })
vim.keymap.set("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { noremap = true })
vim.keymap.set("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", { noremap = true })

-- notion
vim.keymap.set("n", "gns", "<cmd>lua require('impulse').menu_search()<CR>", { noremap = true })
vim.keymap.set("n", "gnl", "<cmd>lua require('impulse').follow_link()<CR>", { noremap = true })

-- obsidian
lvim.builtin.which_key.mappings["n"] = {
    name = "+Obsidian",
    s = { ":ObsidianSearch<cr>", "Search Text" },
    g = { ":ObsidianFollowLink<cr>", "Follow Link" },
    l = { ":ObsidianLink<cr>", "Link" },
    n = { "<cmd>ObsidianLinkNew<cr>", "Link New" },
    N = { "<cmd>ObsidianNew<cr>", "New" },
    f = { "<cmd>ObsidianQuickSwitch<cr>", "Switch" },
    t = { "<cmd>ObsidianToday<cr>", "Today" },
    T = { "<cmd>ObsidianTemplate<cr>", "Template" },
    y = { "<cmd>ObsidianYesterday<cr>", "Yesterday" },
}

lvim.builtin.which_key.mappings["u"] = {
    name = "+LeetcodeBuddy",
    l = { "<cmd>LBQuestions<cr>", "List Questions" },
    v = { "<cmd>LBQuestion<cr>", "View Question" },
    r = { "<cmd>LBReset<cr>", "Reset Code" },
    t = { "<cmd>LBTest<cr>", "Run Code" },
    s = { "<cmd>LBSubmit<cr>", "Submit Code" },
}
