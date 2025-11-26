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
}
