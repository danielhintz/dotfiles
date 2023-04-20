return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'scrooloose/nerdcommenter'
    use 'sbdchd/neoformat'
    use 'neovim/nvim-lspconfig'
    use 'vimwiki/vimwiki'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'mbbill/undotree'
    use 'zchee/vim-flatbuffers'
    use 'yanick/nvim-taskwarrior'
    use 'michalbachowski/vim-wombat256mod'
    use 'integralist/vim-mypy'
    use 'easymotion/vim-easymotion'
    use 'bkad/CamelCaseMotion'
    use 'vim-scripts/taglist.vim'
    use 'ntpeters/vim-better-whitespace'
    use 'preservim/nerdtree'
    use 'mg979/vim-visual-multi'
    use 'google/vim-maktaba'
    use 'bazelbuild/vim-bazel'
    use 'rhysd/conflict-marker.vim'
    use 'github/copilot.vim'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
end)
