return {
  'saghen/blink.nvim',
  build = 'cargo build --release', -- for delimiters
  keys = {
    -- chartoggle
    {
      ';',
      function()
        require('blink.chartoggle').toggle_char_eol ';'
      end,
      mode = { 'n', 'v' },
      desc = 'Toggle ; at eol',
    },
    {
      ',',
      function()
        require('blink.chartoggle').toggle_char_eol ','
      end,
      mode = { 'n', 'v' },
      desc = 'Toggle , at eol',
    },

    -- tree
    -- { '<C-e>', '<cmd>BlinkTree reveal<cr>', desc = 'Reveal current file in tree' },
    -- { '<leader>E', '<cmd>BlinkTree toggle<cr>', desc = 'Reveal current file in tree' },
    -- { '<leader>e', '<cmd>BlinkTree toggle-focus<cr>', desc = 'Toggle file tree focus' },
  },
  -- all modules handle lazy loading internally
  lazy = false,
  opts = {
    chartoggle = { enabled = true },
    delimiters = {
      enabled = true,
      highlights = {
        'RainbowOrange',
        'RainbowPurple',
        'RainbowBlue',
      },
      priority = 200,
      ns = vim.api.nvim_create_namespace 'blink.delimiters',
      debug = false,
    },
    indent = {
      enabled = true,
      -- start with indent guides visible
      visible = true,
      blocked = {
        buftypes = {},
        filetypes = {},
      },
      static = {
        enabled = true,
        char = '▏',
        priority = 1,
        -- specify multiple highlights here for rainbow-style indent guides
        -- highlights = { 'BlinkIndentRed', 'BlinkIndentOrange', 'BlinkIndentYellow', 'BlinkIndentGreen', 'BlinkIndentViolet', 'BlinkIndentCyan' },
        highlights = { 'BlinkIndent' },
      },
      scope = {
        enabled = true,
        char = '▏',
        priority = 1024,
        -- set this to a single highlight, such as 'BlinkIndent' to disable rainbow-style indent guides
        -- highlights = { 'BlinkIndent' },
        highlights = {
          'BlinkIndentRed',
          'BlinkIndentYellow',
          'BlinkIndentBlue',
          'BlinkIndentOrange',
          'BlinkIndentGreen',
          'BlinkIndentViolet',
          'BlinkIndentCyan',
        },
        underline = {
          -- enable to show underlines on the line above the current scope
          enabled = true,
          highlights = {
            'BlinkIndentRedUnderline',
            'BlinkIndentYellowUnderline',
            'BlinkIndentBlueUnderline',
            'BlinkIndentOrangeUnderline',
            'BlinkIndentGreenUnderline',
            'BlinkIndentVioletUnderline',
            'BlinkIndentCyanUnderline',
          },
        },
      },
    },
  },
}
