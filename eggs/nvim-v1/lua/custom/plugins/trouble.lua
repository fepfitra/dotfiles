return {
  'folke/trouble.nvim',
  opts = {
    modes = {
      symbols = {
        win = {
          -- position = 'right',
        },
      },
    },
  },
  cmd = 'Trouble',
  keys = {
    {
      '<leader>ts',
      '<cmd>Trouble symbols toggle focus=true<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>tt',
      '<cmd>Trouble todo toggle type=float<cr>',
      desc = 'Todo (Trouble)',
    },
    {
      '<leader>td',
      '<cmd>Trouble diagnostics toggle focus=true<cr>',
      desc = 'Diagnostics (Trouble)',
    },
  },
}
