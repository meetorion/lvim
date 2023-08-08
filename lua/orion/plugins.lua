lvim.plugins = {
    {
        "Dhanus3133/LeetBuddy.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("leetbuddy").setup({
                domain = "cn",
                language = "cpp",
            })
        end,

    },
    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = { "BufReadPre /home/leejoy/obsidian/neovim/**.md" },
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
        -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            dir = "~/obsidian/neovim", -- no need to call 'vim.fn.expand' here
            mappings = {},
            -- mappings = {
            --     ["gv"] = require("obsidian.mapping").gf_passthrough(),
            -- },

            -- see below for full list of options 👇
        },
    },
    -- gpt
    {
        "robitx/gp.nvim",
        config = function()
            require("gp").setup()

            -- or setup with your own config (see Install > Configuration in Readme)
            -- require("gp").setup(conf)

            -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
        end,
    },
    -- workflow
    -- {
    --     "m4xshen/hardtime.nvim",
    --     opts = {}
    -- },
    -- code
    -- {
    --     "Dhanus3133/LeetBuddy.nvim",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-telescope/telescope.nvim",
    --     },
    --     config = function()
    --         require("leetbuddy").setup({
    --             domain = "cn", -- `cn` for chinese leetcode
    --             language = "cpp",
    --         })
    --     end,
    --     keys = {
    --         { "<leader>uq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
    --         { "<leader>ul", "<cmd>LBQuestion<cr>",  desc = "View Question" },
    --         { "<leader>ur", "<cmd>LBReset<cr>",     desc = "Reset Code" },
    --         { "<leader>ut", "<cmd>LBTest<cr>",      desc = "Run Code" },
    --         { "<leader>us", "<cmd>LBSubmit<cr>",    desc = "Submit Code" },
    --     },
    -- },
    -- LSP
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {}
        end
    },


    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},  -- Loads default behaviour
                    ["core.concealer"] = {}, -- Adds pretty icons to your documents
                    ["core.dirman"] = {      -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                        },
                    },
                },
            }
        end,
    },
    -- Notion
    {
        "chrsm/impulse.nvim",
        config = function()
            require("impulse").setup({
                always_refetch = true,
            })
        end,
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    },
    -- AI
    {
        "mthbernardes/codeexplain.nvim",
        lazy = true,
        cmd = "CodeExplain",
        build = function()
            vim.cmd([[silent UpdateRemotePlugins]])
        end,
    },
    {
        "Bryley/neoai.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        cmd = {
            "NeoAI",
            "NeoAIOpen",
            "NeoAIClose",
            "NeoAIToggle",
            "NeoAIContext",
            "NeoAIContextOpen",
            "NeoAIContextClose",
            "NeoAIInject",
            "NeoAIInjectCode",
            "NeoAIInjectContext",
            "NeoAIInjectContextCode",
        },
        keys = {
            { "<leader>as", desc = "summarize text" },
            { "<leader>ag", desc = "generate git message" },
        },
        config = function()
            require("neoai").setup({
                -- Options go here
            })
        end,
    },
    -- {
    --     'Exafunction/codeium.vim',
    --     config = function()
    --         -- Change '<C-g>' here to any keycode you like.
    --         -- vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    --         vim.keymap.set('i', '<M-;>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    --         vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    --         vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    --         vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    --     end
    -- },
    -- Add Codeium support, pin to stable version due to crash on input auth key
    -- {
    --     "jcdickinson/codeium.nvim",
    --     commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
    --     config = true,
    -- },
    {
        "jcdickinson/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    },

    -- IDES
    -- python
    "ChristianChiarulli/swenv.nvim",
    "stevearc/dressing.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest",
    "nvim-neotest/neotest-python",
    'metakirby5/codi.vim',
    {
        "mickael-menu/zk-nvim",
        config = function()
            require("zk").setup({
                -- See Setup section below
            })
        end
    },

    --IDEs
    --go
    "olexsmir/gopher.nvim",
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    "leoluz/nvim-dap-go",

    -- lazy.nvim
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         -- "rcarriga/nvim-notify",
    --     }
    -- },
    {
        "williamboman/mason.nvim",
        "mfussenegger/nvim-dap",
        "jay-babu/mason-nvim-dap.nvim",
    },
    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
        config = function() require('competitest').setup() end,
    },
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("chatgpt").setup({
                chat = {
                    keymaps = {
                        close = { "jk", "kj", "<Esc>" },
                        yank_last = "<C-y>",
                        scroll_up = "<C-u>",
                        scroll_down = "<C-d>",
                        toggle_settings = "<C-o>",
                        new_session = "<C-n>",
                        cycle_windows = "<Tab>",
                    },
                },
                popup_input = {
                    submit = "<M-Enter>",
                },
            })
        end,
    },
    -- 'dense-analysis/ale',
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require "hop".setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    },
    { "ellisonleao/gruvbox.nvim",          priority = 1000 },
    {
        "james1236/backseat.nvim",
        config = function()
            require("backseat").setup({
                -- Alternatively, set the env var $OPENAI_API_KEY by putting "export OPENAI_API_KEY=sk-xxxxx" in your ~/.bashrc
                openai_model_id = 'gpt-3.5-turbo', --gpt-4 (If you do not have access to a model, it says "The model does not exist")
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
    -- "github/copilot.vim",
    "LunarVim/synthwave84.nvim",
    "roobert/tailwindcss-colorizer-cmp.nvim",
    "lunarvim/github.nvim",
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- "christianchiarulli/nvim-ts-rainbow",
    "mfussenegger/nvim-jdtls",
    -- "karb94/neoscroll.nvim",
    "opalmay/vim-smoothie",
    {
        "j-hui/fidget.nvim",
        version = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    },
    "christianchiarulli/nvim-ts-autotag",
    "kylechui/nvim-surround",
    "christianchiarulli/harpoon",
    "MattesGroeger/vim-bookmarks",
    "NvChad/nvim-colorizer.lua",
    "ghillb/cybu.nvim",
    "moll/vim-bbye",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
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
    "hrsh7th/cmp-emoji",
    "ggandor/leap.nvim",
    "nacro90/numb.nvim",
    -- "TimUntersberger/neogit",
    "sindrets/diffview.nvim",
    "simrat39/rust-tools.nvim",
    -- "olexsmir/gopher.nvim",
    "leoluz/nvim-dap-go",
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
}
