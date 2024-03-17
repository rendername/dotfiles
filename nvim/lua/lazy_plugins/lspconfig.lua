return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'folke/neodev.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'l3mon4d3/luasnip',
        'saadparwaiz1/cmp_luasnip',
    },
    config = function()
        local lsp_bin_path = "/home/anthony/.local/share/nvim/mason/bin/"
        local lsp_config = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local cmp = require('cmp')

        vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

        -- for neovim development completion
        require("neodev").setup({})

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            },
        })

        lsp_config.gopls.setup({
            capabilities = capabilities,
            cmd = { lsp_bin_path.."gopls" },
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            end,
        })

        lsp_config.lua_ls.setup({
            capabilities = capabilities,
            cmd = { lsp_bin_path.."lua-language-server" },
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {'vim'},
                    },
                },
            },
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            end,
        })

        --not working for some reason, no time to fix at the moment
        --lsp_config.bashls.setup({
        --    capabilities = capabilities,
        --    cmd = {lsp_bin_path.."bash-language-server", "start"},
        --    on_attach = function()
        --        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        --        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        --    end,
        --})

        lsp_config.clangd.setup({
            capabilities = capabilities,
            cmd = {lsp_bin_path.."clangd"},
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            end,
        })

        lsp_config.csharp_ls.setup({
            capabilities = capabilities,
            cmd = {lsp_bin_path.."csharp-ls"},
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            end,
        })

        lsp_config.pylsp.setup({
            capabilities = capabilities,
            cmd = {lsp_bin_path.."pylsp"},
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            end,
        })

        lsp_config.terraformls.setup({
            capabilities = capabilities,
            cmd = {lsp_bin_path.."terraform-ls", "serve"},
            on_attach = function()
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            end,
        })
    end,
}
