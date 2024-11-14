return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    keys = {
      {
        "<leader>fe",
        function()
          require("nvim-tree.api").tree.toggle({ path = vim.fn.getcwd() })
        end,
        desc = "Explorer NvimTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("nvim-tree.api").tree.toggle({ path = vim.uv.cwd() })
        end,
        desc = "Explorer NvimTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NvimTree (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NvimTree (cwd)", remap = true },
    },
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      view = {
        width = 30,
        mappings = {
          list = {
            { key = "l", action = "edit" },
            { key = "h", action = "close_node" },
            { key = "<space>", action = "" }, -- unbind space
            {
              key = "Y",
              action = "copy_path",
              action_cb = function(node)
                vim.fn.setreg("+", node.absolute_path, "c")
              end,
            },
            {
              key = "O",
              action = "system_open",
              action_cb = function(node)
                -- Open file with system default application
                local system = vim.fn.has("win32") == 1 and "start"
                  or vim.fn.has("macunix") == 1 and "open"
                  or "xdg-open"
                vim.fn.jobstart({ system, node.absolute_path }, { detach = true })
              end,
            },
            { key = "P", action = "preview" },
          },
        },
      },
      renderer = {
        indent_markers = {
          enable = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            none = " ",
          },
        },
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
            },
            git = {
              unstaged = "󰄱",
              staged = "󰱒",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
    },
    config = function(_, opts)
      -- Setup with the provided options
      require("nvim-tree").setup(opts)

      -- Auto refresh on Lazygit close
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          require("nvim-tree.api").tree.reload()
        end,
      })

      -- Handle directory argument
      local function open_nvim_tree(data)
        local is_directory = vim.fn.isdirectory(data.file) == 1

        if is_directory then
          vim.cmd.cd(data.file)
          require("nvim-tree.api").tree.open()
        end
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = open_nvim_tree,
      })
    end,
  },
}
