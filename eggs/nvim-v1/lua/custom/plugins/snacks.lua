return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
     ██╗ █████╗ ██╗    ██╗██╗██████╗ 
     ██║██╔══██╗██║    ██║██║██╔══██╗
     ██║███████║██║ █╗ ██║██║██████╔╝
██   ██║██╔══██║██║███╗██║██║██╔══██╗
╚█████╔╝██║  ██║╚███╔███╔╝██║██║  ██║
 ╚════╝ ╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝╚═╝  ╚═╝
                                     
				]],
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    image = {
      enabled = true,
      max_width = 80,
      max_height = 40,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    rename = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
