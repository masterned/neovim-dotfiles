local options = {
  backup         = false,
  clipboard      = 'unnamedplus',
  cmdheight      = 2,
  conceallevel   = 0,
  cursorline     = true,
  expandtab      = true,
  fileencoding   = 'utf-8',
  guifont        = 'FiraCode Nerd Font',
  hlsearch       = true,
  ignorecase     = true,
  mouse          = 'a',
  number         = true,
  numberwidth    = 4,
  pumheight      = 10,
  relativenumber = false,
  scrolloff      = 8,
  shiftwidth     = 2,
  showmode       = false,
  showtabline    = 2,
  sidescrolloff  = 8,
  signcolumn     = 'yes',
  smartcase      = true,
  smartindent    = true,
  splitbelow     = true,
  splitright     = true,
  swapfile       = false,
  tabstop        = 2,
  termguicolors  = true,
  timeoutlen     = 1000,
  undofile       = true,
  updatetime     = 300,
  wrap           = false,
  writebackup    = false,
  completeopt    = {
    'menuone',
    'noselect',
  },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.iskeyword:append '-'
vim.opt.shortmess:append 'c'
vim.opt.whichwrap:append '<,>,[,],h,l'

