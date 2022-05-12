-- Automatically install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }

  print 'Installing packer clone and reopen Neovim...'

  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever plugins.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Protect call first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Packer popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'          -- have packer manage itself
  use 'nvim-lua/popup.nvim'             -- implement popup
  use 'nvim-lua/plenary.nvim'           -- lua helper functions

  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use 'arcticicestudio/nord-vim'
  use 'xiyaowong/nvim-transparent'

  -- cmp plugins
  use 'hrsh7th/nvim-cmp'                -- the completion plugin
  use 'hrsh7th/cmp-buffer'              -- buffer completions
  use 'hrsh7th/cmp-path'                -- path completions
  use 'hrsh7th/cmp-cmdline'             -- command line completions
  use 'saadparwaiz1/cmp_luasnip'        -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'            -- LSP completions
  use 'hrsh7th/cmp-nvim-lua'            -- lua completions

  -- snippets
  use 'L3MON4D3/LuaSnip'                -- snippet engine
  use 'rafamadriz/friendly-snippets'    -- more snippets

  -- LSP
  use 'neovim/nvim-lspconfig'           -- enable LSP
  use 'williamboman/nvim-lsp-installer' -- simple language server installer

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Sync & update all packages
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

