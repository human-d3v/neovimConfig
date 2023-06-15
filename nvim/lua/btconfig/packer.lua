-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --color scheme
  use('NLKNguyen/papercolor-theme')

  --treesitter & treesitter playground
    --treesitter displays the Abstract Syntax Tree in a separate panel when walking through code. 
  use ('nvim-treesitter/nvim-treesitter',{run= ':TSUpdate'})
  use ('nvim-treesitter/playground')

  --harpoon from theprimeagen
  use ('nvim-lua/plenary.nvim')
  use ('ThePrimeagen/harpoon')

  --undotree
   -- undotree opens the change tree in a separate panel to walk through recent changes. 
  use('mbbill/undotree')

  --vim-fugitive
    --this plugin allows you to navigate a git repository and track changes
  use('tpope/vim-fugitive')

  --lspZero
    --this language server protocol is used to help in coding by providing syntax, parsers, etc. 
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {                                      -- Optional
		  'williamboman/mason.nvim',
		  run = function()
			  pcall(vim.cmd, 'MasonUpdate')
		  end,
	  },
	  {'williamboman/mason-lspconfig.nvim'}, -- Optional

	  -- Autocompletion
	  {'hrsh7th/nvim-cmp'},     -- Required
	  {'hrsh7th/cmp-nvim-lsp'}, -- Required
	  {'L3MON4D3/LuaSnip'},     -- Required
          }
  }

  --this is an autoclosing bracket plugin
use {
  'abecodes/tabout.nvim',
  config = function()
    require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
    default_shift_tab = '<C-d>', -- reverse shift default action,
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
  end,
	wants = {'nvim-treesitter'}, -- or require if not used so far
	after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
}

  use('rstacruz/vim-closer')

  --setting up my ide to code in R
  --Nvim-R
    --use('jalvesaq/Nvim-R')
  --ncm-R
    --use('gaalcaras/ncm-R')

end)
