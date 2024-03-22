require("lazy").setup({
    "junegunn/seoul256.vim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    {
        "mrcjkb/rustaceanvim", version = "^4", ft = { "rust" },
    },
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    {
        "nvim-neo-tree/neo-tree.nvim",branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "lukas-reineke/indent-blankline.nvim",main = "ibl",opts = {},
    },
    {
        "numToStr/Comment.nvim", opts = {}, lazy = false,
    },
})
