return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Nice to haves
    use 'scrooloose/nerdcommenter'
    use 'psliwka/vim-smoothie'
    use 'mbbill/undotree'
    use 'preservim/nerdtree'
    use 'vim-scripts/taglist.vim'

    -- Nicer diff mode
    use 'rickhowe/diffchar.vim'

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'vimwiki/vimwiki'

    -- Lsp + completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- File formats
    use 'zchee/vim-flatbuffers'

    -- Color schemes
    use 'michalbachowski/vim-wombat256mod'

    -- Motion
    use 'easymotion/vim-easymotion'
    use 'bkad/CamelCaseMotion'

    -- Highlight trailing whitespace
    use 'ntpeters/vim-better-whitespace'

    -- Multiple cursors
    use 'mg979/vim-visual-multi'

    -- Copilot
    use 'github/copilot.vim'

    -- Git
    use 'rhysd/conflict-marker.vim'
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- Formatting
    use 'sbdchd/neoformat'
end)
