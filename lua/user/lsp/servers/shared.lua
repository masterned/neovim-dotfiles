local function lsp_keymaps(bufnr)
  local keymaps = {
    ['lsp.buf'] = {
      ['gD']          = 'declaration()',
      ['gd']          = 'definition()',
      ['K']           = 'hover()',
      ['gi']          = 'implementation()',
      ['<C-k>']       = 'signature_help()',
      ['<leader>rn']  = 'rename()',
      ['gr']          = 'references()',
      ['<leader>ca']  = 'code_action()',
    },
    ['diagnostic'] = {
      --['<leader>f']   = 'open_float()',
      ['gl']          = 'open_float()',
      ['[d']          = 'goto_prev({ border = \'rounded\' })',
      [']d']          = 'goto_next({ border = \'rounded\' })',
      ['<leader>q']   = 'setloclist()',
    }
  }

  for module, keypairs in pairs(keymaps) do
    for key, method in pairs(keypairs) do
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        key,
        '<cmd>lua vim.' .. module .. '.' .. method .. '<CR>',
        { noremap = true, silent = true }
      )
    end
  end

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
      false
    )
  end
end

return {
  on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
  end,
}

