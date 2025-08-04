-- lua/plugins/indent.lua
return {
  {
    'NMAC427/guess-indent.nvim',
    config = function()
      require('guess-indent').setup {}
    end,
    event = 'BufReadPre', -- Optional: Lazy load when opening a file
  },
}
