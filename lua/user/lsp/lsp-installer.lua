local lsp_installer = require('nvim-lsp-installer')

lsp_installer.setup {
  ui = {
    icons = {
      server_installed    = '✓',
      server_pending      = '➜',
      server_uninstalled  = '✗',
    },
  },
}

local lsp_config = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lsp_config[server.name].setup {
    capabilities  = require('cmp_nvim_lsp').update_capabilities(capabilities),
    on_attach     = require('user.lsp.servers.' .. server.name).on_attach,
    settings      = require('user.lsp.servers.' .. server.name).settings,
    flags         = {
      --debounce_text_changes = 150,
    },
  }
end

