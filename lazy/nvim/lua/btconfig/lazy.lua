local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

local plugins = {
	--nvim telescope. works as a fuzzy finder 
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
	--colorscheme
		'NLKNguyen/papercolor-theme',
	--treesitter	
		{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
		('nvim-treesitter/playground'),
	--harpoon
		('nvim-lua/plenary.nvim'),
		('ThePrimeagen/harpoon'),
	--undotree
		('mbbill/undotree'),
	--fugitive
		--allows you to navigate a git repo and track changes
		('tpope/vim-fugitive'),
	--lspZero
		{
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v2.x',
			dependencies = {
				-- LSP Support
				{'neovim/nvim-lspconfig'},
				{
					'williamboman/mason.nvim',
					build = function()
						pcall(vim.cmd, 'MasonUpdate')
					end,
				},
				{'williamboman/mason-lspconfig.nvim'}, --optional

				--autocompletion
					{'hrsh7th/nvim-cmp'},			-- required
					{'hrsh7th/cmp-nvim-lsp'},	-- required
					{'L3MON4D3/LuaSnip'},			-- required
			}
		},
		'abecodes/tabout.nvim',
		'rstacruz/vim-closer',

		--for R programming
		'jalvesaq/Nvim-R',
		'gaalcaras/ncm-R'
}


require("lazy").setup(plugins, {})
