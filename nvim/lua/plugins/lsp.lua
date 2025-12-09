return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({
			'nixd',
			'nil_ls'
		})
		local file = io.open(
			vim.fs.joinpath(vim.env.PWD, '.nvim-lsp')
		)
		if (file == nil) then
			return
		end
		for line in file:lines("*l") do
			vim.lsp.enable(line)
		end
		file:close()
	end,
}
