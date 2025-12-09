return {
	enable = true,
	"nvim-treesitter/nvim-treesitter",
	branch = 'master',
	lazy = false,
	build = ":TSUpdate",
	config = function ()
		require('nvim-treesitter.configs').setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = false
			}
		})
	end
}
