vim.lsp.set_log_level("debug")
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    print("Python file detected, starting ty...")
    vim.lsp.start({
      name = 'ty',
      cmd = { 'ty', 'server' },
      root_dir = vim.fn.getcwd(),
    })
  end,
})
