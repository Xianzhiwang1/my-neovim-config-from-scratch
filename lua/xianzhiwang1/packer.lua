-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	-- telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	-- color
	use {'morhetz/gruvbox', config = function() vim.cmd.colorscheme("gruvbox") end }
	-- treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	-- harpoon
	use('theprimeagen/harpoon')
	-- undotree
	use('mbbill/undotree')
	-- vim-fugitive
	use('tpope/vim-fugitive')

end)




