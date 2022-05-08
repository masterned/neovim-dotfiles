local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap

-- set space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mappings =
  { n = -- normal
    -- better window management
    { ["<C-h>"] = "<C-w>h"
    , ["<C-j>"] = "<C-w>j"
    , ["<C-k>"] = "<C-w>k"
    , ["<C-l>"] = "<C-w>l"

    -- show nav tree
    , ["<leader>e"] = ":Lex 30<cr>"

    -- resize w/ arrows
    , ["<C-Up>"] = ":resize +2<CR>"
    , ["<C-Down>"] = ":resize -2<CR>"
    , ["<C-Left>"] = ":vertical resize -2<CR>"
    , ["<C-Right>"] = ":vertical resize +2<CR>"

    , ["<S-l>"] = ":bnext<CR>"
    , ["<S-h>"] = ":bprevious<CR>"
    }

  , i = -- insert
    { ["jk"] = "<ESC>"  -- quick insert exit
    }

  , v = -- visual
    -- stay in indent mode
    { ["<"] = "<gv"
    , [">"] = ">gv"

    -- move text up & down
    , ["<A-j>"] = ":m .+1<CR>=="
    , ["<A-k>"] = ":m .-2<CR>=="

    , ["p"] = "\"_dP"
    }

  , x = -- visual block
    -- move test up & down
    { ["J"] = ":move '>+1<CR>gv-gv"
    , ["K"] = ":move '<-2<CR>gv-gv"
    , ["<A-j>"] = ":move '>+1<CR>gv-gv"
    , ["<A-k>"] = ":move '<-2<CR>gv-gv"
    }

  , t = -- terminal
    { ["<C-h>"] = "<C-\\><C-N><C-w>h"
    , ["<C-j>"] = "<C-\\><C-N><C-w>j"
    , ["<C-k>"] = "<C-\\><C-N><C-w>k"
    , ["<C-l>"] = "<C-\\><C-N><C-w>l"
    }
  }

for mode, mapping in pairs(mappings) do
  for key, value in pairs(mapping) do
    keymap(mode, key, value, opts)
  end
end

