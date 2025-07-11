-- In your plugins configuration file (e.g., lua/plugins/gemini.lua)
return {
  'kiddos/gemini.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- Optional, for a better UI
  },
  config = function()
    require('gemini').setup()
  end,
}
