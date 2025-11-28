-- auto enter zenmode for md files
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*.md',
  command = 'ZenMode',
})

-- ensure unix line endings for .sh files
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.sh',
  callback = function()
    vim.bo.fileformat = 'unix'
  end,
})
