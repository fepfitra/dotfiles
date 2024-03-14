return {
  'numToStr/Comment.nvim',
  opts = {
  },
  lazy = false,
  config = function()
    local api = require('Comment.api')
    vim.keymap.set('n', '<leader>/', api.toggle.linewise.current)
  end
}
