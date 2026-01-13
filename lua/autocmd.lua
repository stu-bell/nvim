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

-- ensure toggle term is min width on entering
vim.api.nvim_create_autocmd('WinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'toggleterm' then
      local target_width = math.floor(vim.o.columns * 0.2)
      local current_width = vim.api.nvim_win_get_width(0)
      if current_width < target_width then
        vim.cmd('vertical resize ' .. target_width)
      end
    end
  end,
})
