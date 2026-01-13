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
    -- <C-j> won't work in 't' mode as it's interpreted as a newline char in terminals.
    vim.keymap.set('n', '<C-j>', function()
      local count = vim.v.count
      if count == 0 then
        vim.cmd 'ToggleTerm'
      else
        vim.cmd(count .. 'ToggleTerm')
      end
    end, { noremap = true, silent = true })

    -- Add keymap for TermNew in normal mode within terminal buffers
    -- if <C-s>, <C-n> etc clash with terminal programs, remove the 't' mode trigger from keymaps below, to just trigger the keymaps in normal mode 'n'
    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = '*',
      callback = function()
        vim.keymap.set({ 't', 'n' }, '<C-n>', function()
          local name = vim.fn.input 'Terminal name: '
          vim.cmd 'close' -- close the current terminal window first
          if name ~= '' then
            vim.cmd('TermNew name="' .. name .. '"')
          else
            vim.cmd 'TermNew'
          end
        end, { buffer = 0 })
        vim.keymap.set({ 't', 'n' }, '<C-s>', function()
          vim.cmd 'close' -- close the current terminal window first
          vim.cmd 'TermSelect'
        end, { desc = 'Replace terminal with another ToggleTerm' })
      end,
    })
  end,
}
