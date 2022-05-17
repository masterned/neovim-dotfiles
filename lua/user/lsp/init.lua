require('lspconfig')
require('user.lsp.lsp-installer')

local signs = {
  Error = '',
  Warn  = '',
  Hint  = '',
  Info  = '',
}

for name, text in pairs(signs) do
  local sign_name = 'DiagnosticSign' .. name
  vim.fn.sign_define(sign_name, { texthl = sign_name, text = text, numhl = '' })
end

vim.diagnostic.config {
  severity_sort    = true,
  underline        = true,
  update_in_insert = true,
  virtual_text     = false,
  float            = {
    focusable = false,
    style     = 'minimal',
    border    = 'rounded',
    source    = 'always',
    header    = '',
    prefix    = '',
  },
  signs            = {
    active = signs,
  },
}

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  border = 'rounded',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
  border = 'rounded',
})

