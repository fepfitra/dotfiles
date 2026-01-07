vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    print("Attached: " .. client.name)
    if client.name == 'ty' then
      vim.defer_fn(function()
        print("Requesting completion from ty...")
        vim.lsp.buf_request(args.buf, 'textDocument/completion', {
          textDocument = { uri = vim.uri_from_bufnr(args.buf) },
          position = { line = 1, character = 5 }
        }, function(err, result)
          if err then print("Error: " .. vim.inspect(err)) end
          if result then
            print("Items: " .. #result.items)
            for i=1,math.min(5, #result.items) do
              print(" - " .. result.items[i].label)
            end
          else
            print("No items")
          end
          os.exit(0)
        end)
      end, 1000)
    end
  end
})
vim.cmd('e test_comp.py')
