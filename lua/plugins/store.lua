-- Browse store.nvim
return {
  'alex-popov-tech/store.nvim',
  dependencies = {
    'OXY2DEV/markview.nvim', -- optional, for pretty readme preview / help window
  },
  cmd = 'Store',
  keys = {
    { '<cmd>store<cr>', '<cmd>Store<cr>', desc = 'Open Plugin Store' },
  },
  opts = {
    -- optional configuration here
  },
}
