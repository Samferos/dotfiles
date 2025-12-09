return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			nix = { "nixfmt" }
		}
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end
}
