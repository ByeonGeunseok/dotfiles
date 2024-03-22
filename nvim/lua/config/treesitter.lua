require("nvim-treesitter.configs").setup({
    -- ensure_installed = { "c", "rust", "python", "typescript", "tsx", "lua", "vim", "vimdoc", "query", "json" },
    ensure_installed = { "c", "python", "typescript", "tsx", "lua", "vim", "vimdoc", "query", "json" },
    auto_install = true,
    highlight = {
        enable = true,
    },
})
