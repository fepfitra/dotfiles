return {
  'echasnovski/mini.indentscope',
  version = false,
  config = function()
    require('mini.indentscope').setup()
  end,
  opts = {
    -- symbol = "▏",
    symbol = '│',
    options = { try_as_border = true },
  },
}
