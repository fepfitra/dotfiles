return {
  'wuelnerdotexe/vim-astro',
  ft = 'astro',
  init = function()
    -- specific configuration for vim-astro if needed
    vim.g.astro_typescript = 'enable'
    vim.g.astro_stylus = 'enable'
  end,
}
