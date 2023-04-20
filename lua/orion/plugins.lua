-- Additional Plugins
lvim.plugins = {
    {
        "james1236/backseat.nvim",
        config = function()
            require("backseat").setup({
                -- Alternatively, set the env var $OPENAI_API_KEY by putting "export OPENAI_API_KEY=sk-xxxxx" in your ~/.bashrc
                openai_api_key = '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', -- Get yours from platform.openai.com/account/api-keys
                openai_model_id = 'gpt-3.5-turbo',                                      --gpt-4 (If you do not have access to a model, it says "The model does not exist")
                -- split_threshold = 100,
                -- additional_instruction = "Respond snarkily", -- (GPT-3 will probably deny this request, but GPT-4 complies)
                -- highlight = {
                --     icon = '', -- ''
                --     group = 'Comment',
                -- }
            })
        end
    },
    "h-hg/fcitx.nvim",
    {
        "dense-analysis/neural",
        -- config = function()
        --     require("neural").setup({
        --         sources = {
        --             openai = {
        --                 api_key = "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",
        --             },
        --         },
        --     })
        -- end,
        -- -- config = function()
    },
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require "lsp_signature".on_attach()
            require "lsp_signature".setup({
                bind = true,
                -- transparency = 10,
            })
        end,
    },
    "voldikss/vim-translator",
    "hrsh7th/cmp-cmdline",
    "voldikss/vim-floaterm",
    "theHamsta/nvim-dap-virtual-text",
    "liuchengxu/vista.vim",
    "ray-x/go.nvim",
    -- "github/copilot.vim",
    "ellisonleao/gruvbox.nvim",
    "LunarVim/synthwave84.nvim",
    "roobert/tailwindcss-colorizer-cmp.nvim",
    "lunarvim/github.nvim",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- "christianchiarulli/nvim-ts-rainbow",
    "mfussenegger/nvim-jdtls",
    -- "karb94/neoscroll.nvim",
    "opalmay/vim-smoothie",
    "j-hui/fidget.nvim",
    "christianchiarulli/nvim-ts-autotag",
    "kylechui/nvim-surround",
    "christianchiarulli/harpoon",
    "MattesGroeger/vim-bookmarks",
    "NvChad/nvim-colorizer.lua",
    "ghillb/cybu.nvim",
    "moll/vim-bbye",
    "folke/todo-comments.nvim",
    "windwp/nvim-spectre",
    "f-person/git-blame.nvim",
    "ruifm/gitlinker.nvim",
    "mattn/vim-gist",
    "mattn/webapi-vim",
    "folke/zen-mode.nvim",
    "lvimuser/lsp-inlayhints.nvim",
    "lunarvim/darkplus.nvim",
    "lunarvim/templeos.nvim",
    "kevinhwang91/nvim-bqf",
    "is0n/jaq-nvim",
    -- "hrsh7th/cmp-emoji",
    "ggandor/leap.nvim",
    "nacro90/numb.nvim",
    "TimUntersberger/neogit",
    "sindrets/diffview.nvim",
    "simrat39/rust-tools.nvim",
    -- "olexsmir/gopher.nvim",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "jose-elias-alvarez/typescript.nvim",
    "mxsdev/nvim-dap-vscode-js",
    "petertriho/nvim-scrollbar",
    "renerocksai/telekasten.nvim",
    -- "renerocksai/calendar-vim",
    {
        "saecki/crates.nvim",
        version = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
            }
        end,
    },
    "MunifTanjim/nui.nvim",
    "jackMort/ChatGPT.nvim",
    {
        "jinh0/eyeliner.nvim",
        config = function()
            require("eyeliner").setup {
                highlight_on_key = true,
            }
        end,
    },
    { "christianchiarulli/telescope-tabs", branch = "chris" },
    "monaqa/dial.nvim",
    {
        "0x100101/lab.nvim",
        build = "cd js && npm ci",
    },
    -- { "tzachar/cmp-tabnine", build = "./install.sh" },
    {
        "zbirenbaum/copilot.lua",
        -- event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                    plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
                }
            end, 1000)
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup {
                formatters = {
                    insert_text = require("copilot_cmp.format").remove_existing,
                },
            }
        end,
    },
    -- "MunifTanjim/nui.nvim",
    -- {
    --   "folke/noice.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("noice").setup()
    --   end,
    -- },

    -- https://github.com/jose-elias-alvarez/typescript.nvim
    -- "rmagatti/auto-session",
    -- "rmagatti/session-lens"
}
