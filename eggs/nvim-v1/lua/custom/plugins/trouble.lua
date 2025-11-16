return {
  'folke/trouble.nvim',
  opts = {
    modes = {
      symbols = {
        win = {
          position = 'left',
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
      '<cmd>Trouble todo toggle focus=true<cr>',
      desc = 'Todo (Trouble)',
    },
    {
      '<leader>td',
      '<cmd>Trouble diagnostics toggle focus=true<cr>',
      desc = 'Diagnostics (Trouble)',
    },
  },
}
