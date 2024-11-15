

return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        init = function(plug, opts)
          require('mason').setup(opts)
          require('mason-lspconfig').setup()
          local mason_lspconfig = require 'mason-lspconfig'
          local servers = {
            gopls = {},
            rust_analyzer = {},
            tsserver = {},
            html = {},

            lua_ls = {
              Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
              },
            },
          }
          mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
          }

          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

          mason_lspconfig.setup_handlers {
            function(server_name)
              require('lspconfig')[server_name].setup {
                capabilities = capabilities,
                settings = servers[server_name],
                filetypes = (servers[server_name] or {}).filetypes,
              }
            end,
          }
        end,
      },
      'williamboman/mason-lspconfig.nvim',

      -- status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      --lua search help
      {'folke/neodev.nvim', opts = { }, },
    },
  }
}
