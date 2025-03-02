return {
{ 'neovim/nvim-lspconfig' },
{ 'hrsh7th/nvim-cmp' },
{ 'hrsh7th/cmp-nvim-lsp' },
{ 'L3MON4D3/LuaSnip' },
{ 'saadparwaiz1/cmp_luasnip' },
{ "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate", -- This ensures parsers are updated when you update plugins
      config = function()
        require 'nvim-treesitter.configs'.setup {
          -- Add languages you want to enable here:
          ensure_installed = { "lua" }, -- Make sure to add "lua" here!

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = true,

          highlight = {
            enable = true,              -- Enable highlighting
            disable = {},               -- List of languages to disable highlighting for (e.g. { "rust" })
            additional_vim_regex_highlight = false, -- Disable slow regex highlightin
          },
        }
      end
    },
}
