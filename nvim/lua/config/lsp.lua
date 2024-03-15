local lspconfig = require("lspconfig")

lspconfig.clangd.setup {}
lspconfig.tsserver.setup {}
lspconfig.pyright.setup {}
lspconfig.lua_ls.setup {}