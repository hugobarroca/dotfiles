return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Global on_attach callback for keymaps
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local client = vim.lsp.get_client_by_id(args.data.client_id)

                -- Keymap helper
                local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
                local opts = { noremap = true, silent = true }

                buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            end
        })

        -- Configure all LSP servers
        local servers = {
            jsonls = {
                settings = {
                    json = {
                        schemas = {
                            { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
                            { fileMatch = { "tsconfig.json" }, url = "https://json.schemastore.org/tsconfig.json" },
                        },
                        validate = { enable = true },
                    }
                },
                flags = { debounce_text_changes = 150 },
            },
            svelte = { flags = { debounce_text_changes = 150 } },
            bashls = {
                cmd = { "bash-language-server", "start" },
                filetypes = { "sh", "bash" },
                root_dir = function() return vim.fn.getcwd() end,
            },
            cssls = { flags = { debounce_text_changes = 150 } },
            ts_ls = { flags = { debounce_text_changes = 150 } },
            lua_ls = {
                flags = { debounce_text_changes = 150 },
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                    }
                },
            },
        }

        -- Register configurations and enable servers
        for name, cfg in pairs(servers) do
            vim.lsp.config(name, cfg)
        end
        vim.lsp.enable(vim.tbl_keys(servers))
    end,
}
