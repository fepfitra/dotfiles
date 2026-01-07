return {
  'mrcjkb/rustaceanvim',
  version = '^6', -- Recommended
  lazy = false, -- This plugin is already lazy
  config = function()
    vim.g.rustaceanvim = {
      server = {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      },
    }
  end,
}
