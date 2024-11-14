return {
  {
    "numToStr/Comment.nvim",
    -- lazy = false,
    config = function()
      local comment = require("Comment")

      -- Set up the Comment.nvim plugin
      comment.setup({
        padding = true,
        sticky = true,
        toggler = {
          line = "<leader>/", -- Line-comment toggle
          block = "<leader>?", -- Block-comment toggle
        },
        opleader = {
          line = "<leader>/", -- Line-comment in operator-pending mode
          block = "<leader>?", -- Block-comment in operator-pending mode
        },
        extra = {
          above = "gcO", -- Comment line above
          below = "gco", -- Comment line below
          eol = "gcA", -- Comment end of line
        },
        mappings = {
          basic = true,
          extra = true,
        },

        -- ignore = nil,
        -- pre_hook = nil,
        -- post_hook = nil,
      })

      -- Use the Comment API safely for keymaps
      local api = require("Comment.api")

      -- Ensure that the keymaps are correctly set
      -- vim.keymap.set("n", "<leader>/", function()
      --   api.toggle.linewise.current()
      -- end, { desc = "Toggle comment on current line" })
      --
      -- vim.keymap.set("v", "<leader>/", function()
      --   api.toggle.linewise(vim.fn.visualmode())
      -- end, { desc = "Toggle comment on selection" })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
}
