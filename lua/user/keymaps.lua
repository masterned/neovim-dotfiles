local opts = { noremap = true, silent = true }

-- set space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local modes = {
  normal = {
    code = 'n',
    opts = opts,
    keymaps = {
      -- better window management
      ['<C-h>'] = '<C-w>h',
      ['<C-j>'] = '<C-w>j',
      ['<C-k>'] = '<C-w>k',
      ['<C-l>'] = '<C-w>l',

      -- resize w/ arrows
      ['<C-Up>']    = ':resize +2<CR>',
      ['<C-Down>']  = ':resize -2<CR>',
      ['<C-Left>']  = ':vertical resize -2<CR>',
      ['<C-Right>'] = ':vertical resize +2<CR>',

      ['<S-l>'] = ':bnext<CR>',
      ['<S-h>'] = ':bprevious<CR>',

      -- NvimTree
      ['<leader>e'] = ':NvimTreeToggle<CR>',
    },
  },

  insert = {
    code = 'i',
    opts = opts,
    keymaps = {
      ['jk'] = '<ESC>',  -- quick insert exit
    },
  },

  visual = {
    code = 'v',
    opts = opts,
    keymaps = {
      -- stay in indent mode
      ['<'] = '<gv',
      ['>'] = '>gv',

      -- move text up & down
      ['<A-j>'] = ':m .+1<CR>==',
      ['<A-k>'] = ':m .-2<CR>==',

      ['p'] = '\"_dP',
    },
  },

  visual_block = {
    code = 'x',
    opts = opts,
    keymaps = {
      -- move text up & down
      ['J'] = ':move \'>+1<CR>gv-gv',
      ['K'] = ':move \'<-2<CR>gv-gv',

      ['<A-j>'] = ':move \'>+1<CR>gv-gv',
      ['<A-k>'] = ':move \'<-2<CR>gv-gv',
    },
  },

  terminal = {
    code = 't',
    opts = {
      silent = true,
    },
    keymaps = {
      -- better navigation
      ['<C-h>'] = '<C-\\><C-N><C-w>h',
      ['<C-j>'] = '<C-\\><C-N><C-w>j',
      ['<C-k>'] = '<C-\\><C-N><C-w>k',
      ['<C-l>'] = '<C-\\><C-N><C-w>l',
    },
  },
}

for _, mode in pairs(modes) do
  for key, value in pairs(mode.keymaps) do
    vim.api.nvim_set_keymap(mode.code, key, value, mode.opts)
  end
end

