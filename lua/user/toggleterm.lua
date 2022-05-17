local toggleterm = require 'toggleterm'

toggleterm.setup {
  size = 12,
  open_mapping = [[<C-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    winblend = 0,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
}

function _G.set_terminal_keymaps()
  local escape = [[<C-\><C-n>]]

  local maps = {
    ['<esc>'] = [[]],
    ['jk'] = [[]],
    ['<C-h>'] = [[<C-W>h]],
    ['<C-j>'] = [[<C-W>j]],
    ['<C-k>'] = [[<C-W>k]],
    ['<C-l>'] = [[<C-W>l]],
  }

  for key, value in pairs(maps) do
    vim.api.nvim_buf_set_keymap(
      0,
      't',
      key,
      escape .. value,
      { noremap = true }
    )
  end
end

vim.api.nvim_create_autocmd(
  'TermOpen',
  {
    pattern = 'term://*',
    desc = 'registers toggleterm\'s keybindings',
    callback = function(_)
      set_terminal_keymaps()
    end,
  }
)

local Terminal = require('toggleterm.terminal').Terminal

local neofetch = Terminal:new {
  cmd = 'neofetch && echo \'Press [Enter] to exit.\' && read',
  hidden = true,
}

function _NEOFETCH_TOGGLE()
  neofetch:toggle()
end


