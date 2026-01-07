local client_id = vim.lsp.start_client({
  name = 'ty',
  cmd = { 'ty', 'server' },
  root_dir = vim.fn.getcwd(),
})

if not client_id then
  print("Failed to start client")
  os.exit(1)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    if args.data.client_id == client_id then
      print("Ty attached to " .. vim.api.nvim_buf_get_name(args.buf))
      vim.defer_fn(function()
        print("Requesting completion...")
        vim.lsp.buf_request(args.buf, 'textDocument/completion', {
          textDocument = { uri = vim.uri_from_bufnr(args.buf) },
          position = { line = 1, character = 5 }
        }, function(err, result, ctx, config)
          if err then
            print("Completion error: " .. vim.inspect(err))
          elseif not result then
            print("No completion result")
          else
            print("Completion items found: " .. #result.items)
            for i, item in ipairs(result.items) do
              if i > 5 then break end
              print(" - " .. item.label)
            end
          end
          os.exit(0)
        end)
      end, 1000)
    end
  end
})

vim.cmd('e test_comp.py')
