return {
  -- no config
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  "nvim-tree/nvim-web-devicons",
  'nvim-treesitter/nvim-treesitter-textobjects',
  'wellle/targets.vim',
  "williamboman/mason.nvim",
  'JoosepAlviste/nvim-ts-context-commentstring',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'lewis6991/gitsigns.nvim',
  'nvim-lua/plenary.nvim',
  'editorconfig/editorconfig-vim',
  'moll/vim-bbye',

  -- with config
  {
    "folke/neoconf.nvim", 
    cmd = "Neoconf" 
  }, {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000 
  }, {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons' 
  },{
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons'
  }, {
    'nvim-tree/nvim-tree.lua', 
    dependencies = 'nvim-tree/nvim-web-devicons'
  }, { 
    "lukas-reineke/indent-blankline.nvim", 
    main = "ibl", 
    opts = {} 
  }, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  }, {
  "neovim/nvim-lspconfig",
  config = function()
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.tsserver.setup{}
  end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
    -- add any options here
    },
    lazy = false,
  }, {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths in commands
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for lua autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets library
      "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")
      -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = { -- configure how nvim-cmp interacts with snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-p>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
  -- sources for autocompletion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- snippets
          { name = "buffer" }, -- text within current buffer
          { name = "path" }, -- file system paths
        }),
  -- configure lspkind for vs-code like pictograms in completion menu
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })
    end,
  }, {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.6',
    -- or                              , branch = '0.1.x',
    dependencies = 'nvim-lua/plenary.nvim'
  }, { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'make' 
  }, {'akinsho/toggleterm.nvim', 
    version = "*", 
    config = true
  },
}
