require('plugins')

vim.cmd('source ~/.config/nvim/autocommands')

vim.opt.bg = 'light'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ts = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 4

vim.g.mapleader = ','
vim.g.nocompatible = true
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false

vim.opt.wildmode = 'longest,list,full'
vim.opt.completeopt = 'menuone,noselect'

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.cmd([[
  syntax on 
  filetype plugin on
]])

vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap=true})

vim.api.nvim_set_keymap('', '<leader>b', ':vsp<space>$BIB<CR>', {})
vim.api.nvim_set_keymap('', '<leader>r', ':vsp<space>$REFER<CR>', {})


--Replace all is aliased to S.
vim.api.nvim_set_keymap('n', 'S', ':%s//g<Left><Left>', {})


--Shortcutting split navigation, saving a keypress:
vim.api.nvim_set_keymap('', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('', '<C-l>', '<C-w>l', {})

vim.g.vimwiki_list = {{path = '~/.local/share/vimwiki/', syntax = 'markdown', ext = '.md', path_html = '~/.local/share/vimwiki_html'}}

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- Enable completion triggered by <c-x><c-o> or <C-Space>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymap('i', '<C-Space>', '<cmd>lua vim.lsp.omnifunc()<CR>', opts)

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>j', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local nvim_lsp = require('lspconfig')
local servers = { 'ccls', 'gopls' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

local util = require("lspconfig/util")
nvim_lsp['pyright'].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    root_dir = function(fname)
        return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or util.path.dirname(fname)
      end
  }


local luasnip = require 'luasnip'
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
