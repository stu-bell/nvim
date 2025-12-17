local default_shell

if vim.fn.executable 'pwsh' == 1 then
  default_shell = 'pwsh' -- PowerShell Core
elseif vim.fn.executable 'powershell' == 1 then
  default_shell = 'powershell' -- Windows PowerShell
elseif vim.fn.executable 'bash' == 1 then
  default_shell = 'bash' -- Fallback to Bash
else
  default_shell = 'sh' -- Fallback to a minimal shell
end
return {
  'akinsho/toggleterm.nvim',
  opts = {
    shell = default_shell,
    direction = 'vertical',
    size = 80,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    -- <number><C-j> triggers ToggleTerm
    -- 1ToggleTerm togglest terminal 1
    -- 2ToggleTerm toggles terminal 2 etc
    vim.keymap.set('n', '<C-j>', function()
      local count = vim.v.count
      if count == 0 then
        vim.cmd 'ToggleTerm'
      else
        vim.cmd(count .. 'ToggleTerm')
      end
    end, { noremap = true, silent = true })

    -- Add keymap for TermNew in normal mode within terminal buffers
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = '*',
      callback = function()
        vim.keymap.set('n', '<C-n>', '<cmd>TermNew<CR>', { buffer = 0 })
      end,
    })
  end,
}
