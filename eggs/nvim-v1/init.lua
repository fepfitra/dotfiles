-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- My own custom settings
vim.opt.fillchars = { eob = ' ' }
vim.cmd 'set tabstop=2'
vim.cmd 'set shiftwidth=2'

vim.lsp.enable 'ty'
vim.lsp.enable 'astro'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- my custom keymap
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require 'lazyinit'

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  require 'custom.plugins.which-key',
  -- require 'custom.plugins.autocompletion',
  require 'custom.plugins.blink',
  require 'custom.plugins.blink_cmp',
  require 'custom.plugins.autoformat',
  require 'custom.plugins.lsp',
  require 'custom.plugins.telescope',
  require 'custom.plugins.rhai',
  require 'custom.themes.tokyonight',
  require 'custom.plugins.comments',
  require 'custom.plugins.lualine',
  require 'custom.plugins.surrond',
  require 'custom.plugins.mini',
  require 'custom.plugins.treesitter',
  require 'custom.themes.solarized',
  require 'custom.themes.gruvbox',
  -- require 'kickstart.plugins.neo-tree',
  require 'custom.plugins.colorizer',
  require 'custom.plugins.trouble',
  require 'custom.plugins.copilot',
  -- require 'custom.plugins.gaslight',
  require 'custom.plugins.gdb',
  require 'custom.plugins.hurl',
  -- require 'custom.plugins.image',
  -- require 'custom.plugins.indentscope',
  require 'custom.plugins.snacks',
  require 'custom.plugins.iron',
  require 'custom.plugins.lazygit',
  require 'custom.plugins.markdown-preview',
  require 'custom.plugins.nvim-tree',
  require 'custom.plugins.smear',
  require 'custom.plugins.typst',
  require 'custom.plugins.wakatime',
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.gitsigns',
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = require 'custom.ui',
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'typst',
  callback = function()
    vim.bo.commentstring = '// %s'
  end,
})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.o.updatetime = 250

-- Create an autocommand to open the floating diagnostic window
-- when the cursor stays put (CursorHold) in Normal or Insert mode (CursorHoldI).
-- vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
--   pattern = '*', -- Apply to all file types
--   callback = function()
--     -- Open a floating window with diagnostics at the cursor position.
--     -- 'focus = false' means the window opens but doesn't steal your cursor focus.
--     vim.diagnostic.open_float(nil, {
--       scope = 'cursor',
--       focusable = false,
--     })
--   end,
-- })

-- OPTIONAL: If you want to disable the inline "virtual text" (like the "Syntax Error" in your image)
-- and only rely on the hover window for messages:
vim.diagnostic.config {
  virtual_text = true,
}
-- Get the window id for a buffer
-- @param bufnr integer
local function buf_to_win(bufnr)
  local current_win = vim.fn.win_getid()

  -- Check if current window has the buffer
  if vim.fn.winbufnr(current_win) == bufnr then
    return current_win
  end

  -- Otherwise, find a visible window with this buffer
  local win_ids = vim.fn.win_findbuf(bufnr)
  local current_tabpage = vim.fn.tabpagenr()

  for _, win_id in ipairs(win_ids) do
    if vim.fn.win_id2tabwin(win_id)[1] == current_tabpage then
      return win_id
    end
  end

  return current_win
end

-- Split a string into multiple lines, each no longer than max_width
-- The split will only occur on spaces to preserve readability
-- @param str string
-- @param max_width integer
local function split_line(str, max_width)
  if #str <= max_width then
    return { str }
  end

  local lines = {}
  local current_line = ''

  for word in string.gmatch(str, '%S+') do
    -- If adding this word would exceed max_width
    if #current_line + #word + 1 > max_width then
      -- Add the current line to our results
      table.insert(lines, current_line)
      current_line = word
    else
      -- Add word to the current line with a space if needed
      if current_line ~= '' then
        current_line = current_line .. ' ' .. word
      else
        current_line = word
      end
    end
  end

  -- Don't forget the last line
  if current_line ~= '' then
    table.insert(lines, current_line)
  end

  return lines
end

---@param diagnostic vim.Diagnostic
local function virtual_lines_format(diagnostic)
  local win = buf_to_win(diagnostic.bufnr)
  local sign_column_width = vim.fn.getwininfo(win)[1].textoff
  local text_area_width = vim.api.nvim_win_get_width(win) - sign_column_width
  local center_width = 5
  local left_width = 1

  ---@type string[]
  local lines = {}
  for msg_line in diagnostic.message:gmatch '([^\n]+)' do
    local max_width = text_area_width - diagnostic.col - center_width - left_width
    vim.list_extend(lines, split_line(msg_line, max_width))
  end

  return table.concat(lines, '\n')
end

-- Don't show virtual text on curresnt line since we'll show virtual_lines
---@param diagnostic vim.Diagnostic
local function virtual_text_format(diagnostic)
  if vim.fn.line '.' == diagnostic.lnum + 1 then
    return nil
  end

  return diagnostic.message
end

vim.diagnostic.config {
  virtual_text = { format = virtual_text_format, severity = { min = vim.diagnostic.severity.WARN } },
  virtual_lines = { format = virtual_lines_format, current_line = true },
  severity_sort = { reverse = false },
}

-- Re-draw diagnostics each line change to account for virtual_text changes

local last_line = vim.fn.line '.'

vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
  callback = function()
    local current_line = vim.fn.line '.'

    -- Check if the cursor has moved to a different line
    if current_line ~= last_line then
      vim.diagnostic.hide()
      vim.diagnostic.show()
    end

    -- Update the last_line variable
    last_line = current_line
  end,
})

-- Re-render diagnostics when the window is resized

vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    vim.diagnostic.hide()
    vim.diagnostic.show()
  end,
})

vim.o.background = 'dark' -- # {< replace_in(`'`, theme.nvim.background) >}
vim.cmd.colorscheme 'gruvbox' -- # {< replace_in(`'`, theme.nvim.colorscheme) >}
