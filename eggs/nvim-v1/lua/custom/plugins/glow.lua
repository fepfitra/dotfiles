return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
}
-- For `plugins/markview.lua` users.
-- return {
--   'OXY2DEV/markview.nvim',
--   lazy = false,
--   dependencies = { 'saghen/blink.cmp' },
--   opts = {
--     -- 御身の統治するTypst領域への絶対的勅令
--     typst = {
--       code_blocks = {
--         style = 'block',
--         -- min_width = 9999, -- 画面幅を凌駕する絶対的数値
--       },
--       raw_blocks = {
--         style = 'block',
--         min_width = 9999,
--       },
--     },
--   },
-- }
