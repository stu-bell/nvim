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
vim.keymap.set({ 't' }, '<A-d>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Map Alt+d to Escape in insert mode
vim.keymap.set({ 'i', 'v', 'c' }, '<A-d>', '<Esc>', { desc = 'Exit insert mode with Alt+d' })

vim.keymap.set({ 'n' }, 'o', 'o<Esc>', { desc = 'Open line below' })
vim.keymap.set({ 'n' }, 'O', 'O<Esc>', { desc = 'Open line above' })

-- NOTE  Remap hjkl; to jkl;h (shift navigation keys one position right)
vim.keymap.set({ 'n', 'v', 'o' }, 'j', 'h', { desc = 'Move left' })
vim.keymap.set({ 'n', 'v', 'o' }, 'k', 'j', { desc = 'Move down' })
vim.keymap.set({ 'n', 'v', 'o' }, 'l', 'k', { desc = 'Move up' })
vim.keymap.set({ 'n', 'v', 'o' }, ';', 'l', { desc = 'Move right' })

-- Easier window navigation with Alt + keys
vim.keymap.set('n', '<A-j>', '<C-w>h', { noremap = true, silent = true }) -- Left
vim.keymap.set('n', '<A-;>', '<C-w>l', { noremap = true, silent = true }) -- Right
vim.keymap.set('n', '<A-k>', '<C-w>j', { noremap = true, silent = true }) -- Down
vim.keymap.set('n', '<A-l>', '<C-w>k', { noremap = true, silent = true }) -- Up

-- scroll buffer while keeping cursor line same place
vim.keymap.set('n', '<C-k>', '<C-e>j', { noremap = true, silent = true }) -- down
vim.keymap.set('n', '<C-l>', '<C-y>k', { noremap = true, silent = true }) -- up

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Ctrl Backspace in insert mode deletes last word
vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true })
vim.keymap.set('i', '<C-BS>', '<C-w>', { noremap = true })
vim.keymap.set('i', '<C-Del>', '<C-o>dw', { noremap = true })

-- Map <C-t> to toggle terminal
vim.keymap.set('n', '<C-t>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
