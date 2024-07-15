require("lsp-setup").setup({
    servers = {
        bashls = {},
        cmake = {},
        clangd = {},
        ccls = {},
        csharp_ls = {},
        dockerls = {},
        eslint = {},
        graphql = {},
        html = {},
        cssls = {},
        spectral = {},
        jsonls = {},
        marksman = {},
        remark_ls = {},
        -- terraformls = {},
        -- tflint = {},
        lua_ls = {},
        sumneko_lua = {},
        lemminx = {},
        sqlls = {},
        pylsp = {},
        pyright = {},
        -- sourcery = {}, -- BUG: client exit 1
        tsserver = {},
        yamlls = {}
    }
})
