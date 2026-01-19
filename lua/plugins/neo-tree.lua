-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    window = {
      width = 20,
      mappings = {
        ['/'] = 'none', -- disable neotree's filter command
        ['f'] = 'none', -- disable neotree's search  command
        -- normal keybindings were mapping l to k, but didn't seem to work in neo-tree, so remap here
        ['l'] = function(state)
          vim.cmd 'normal! k'
        end,
        ['\\'] = 'close_window',
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    -- Autocommand to ensure minimum width when entering neo-tree
    local min_width = 20
    vim.api.nvim_create_autocmd('BufEnter', {
      pattern = '*',
      callback = function()
        if vim.bo.filetype == 'neo-tree' then
          local current_width = vim.api.nvim_win_get_width(0)
          if current_width < min_width then
            vim.api.nvim_win_set_width(0, min_width)
          end
        end
      end,
      desc = 'Ensure neo-tree minimum width',
    })
  end,
}
