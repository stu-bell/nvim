-- auto enter zenmode for md files
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*.md',
  command = 'ZenMode',
})
