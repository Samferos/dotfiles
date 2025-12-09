vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', {silent = true, noremap = true})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {silent = true, noremap = true, desc = "Code actions"})
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {desc = "Rename symbol"})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local whichkey = require("which-key")

whichkey.add(
	{
  -- Debugger
  {
      "<leader>d",
      group = "Debugger",
      nowait = true,
      remap = false,
  },
  {
      "<leader>dt",
      function()
          require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
      nowait = true,
      remap = false,
  },
  {
      "<leader>dc",
      function()
          require("dap").continue()
      end,
      desc = "Continue",
      nowait = true,
      remap = false,
  },
  {
      "<leader>di",
      function()
          require("dap").step_into()
      end,
      desc = "Step Into",
      nowait = true,
      remap = false,
  },
  {
      "<leader>do",
      function()
          require("dap").step_over()
      end,
      desc = "Step Over",
      nowait = true,
      remap = false,
  },
  {
      "<leader>du",
      function()
          require("dap").step_out()
      end,
      desc = "Step Out",
      nowait = true,
      remap = false,
  },
  {
      "<leader>dr",
      function()
          require("dap").repl.open()
      end,
      desc = "Open REPL",
      nowait = true,
      remap = false,
  },
  {
      "<leader>dl",
      function()
          require("dap").run_last()
      end,
      desc = "Run Last",
      nowait = true,
      remap = false,
  },
  {
      "<leader>dq",
      function()
          require("dap").terminate()
          require("dapui").close()
          require("nvim-dap-virtual-text").toggle()
      end,
      desc = "Terminate",
      nowait = true,
      remap = false,
  },
  {
      "<leader>db",
      function()
          require("dap").list_breakpoints()
      end,
      desc = "List Breakpoints",
      nowait = true,
      remap = false,
  },
  {
      "<leader>de",
      function()
          require("dap").set_exception_breakpoints({ "all" })
      end,
      desc = "Set Exception Breakpoints",
      nowait = true,
      remap = false,
  },
}
)
