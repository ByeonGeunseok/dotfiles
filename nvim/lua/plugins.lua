local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "junegunn/seoul256.vim",
        config = function()
            vim.cmd.colorscheme("seoul256")
        end,
    },
    {
        "preservim/nerdtree",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                -- ensure_installed = { "c", "rust", "python", "typescript", "tsx", "lua", "vim", "vimdoc", "query", "json" },
                ensure_installed = { "c", "python", "typescript", "tsx", "lua", "vim", "vimdoc", "query", "json" },
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.clangd.setup {}
            -- lspconfig.rust_analyzer.setup {
                --     settings = {
                    --         ["rust-analyzer"] = {},
                    --     },
                    -- }
                    lspconfig.tsserver.setup {}
                    lspconfig.pyright.setup {}
                    lspconfig.lua_ls.setup {}
                end,
            },
            {
                "lukas-reineke/indent-blankline.nvim",
                main = "ibl",
                opts = {
                },
                config = function()
                    local highlight = {
                        "RainbowRed",
                        "RainbowYellow",
                        "RainbowBlue",
                        "RainbowOrange",
                        "RainbowGreen",
                        "RainbowViolet",
                        "RainbowCyan",
                    }

                    local hooks = require "ibl.hooks"
                    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
                    end)

                    require("ibl").setup { indent = { highlight = highlight } }
                end,
            },
            {
                "tpope/vim-fugitive",
            },
            {
                "lewis6991/gitsigns.nvim",
                config = function()
                    require("gitsigns").setup {
                        signs = {
                            add          = { text = '│' },
                            change       = { text = '│' },
                            delete       = { text = '_' },
                            topdelete    = { text = '‾' },
                            changedelete = { text = '~' },
                            untracked    = { text = '┆' },
                        },
                    }
                end,
            },
            {
                "numToStr/Comment.nvim",
                opts = {
                    -- add any options here
                },
                lazy = false,
            },

        })
