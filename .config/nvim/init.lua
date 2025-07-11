require("config.lazy")

vim.cmd('source ~/.config/nvim/vimrc')

vim.opt.bg = 'dark'
vim.opt.mouse = ''
vim.opt.clipboard = 'unnamedplus'
vim.opt.ts = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 4

vim.g.mapleader = ','
vim.g.nocompatible = true
vim.opt.encoding = 'utf-8'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false

vim.opt.nrformats = 'bin,hex,octal,alpha'

vim.opt.wildmode = 'longest,list,full'
vim.opt.completeopt = 'menuone,noselect'

vim.opt.spelllang = 'en'
vim.opt.spellsuggest = 'best'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.cmd([[
filetype plugin on
colorscheme wombat256mod
]])
--colorscheme retrobox

vim.g.mkdp_port = 8080
vim.g.mkdp_echo_preview_url = 1
vim.g.mkdp_open_to_the_world = 1

vim.o.updatetime = 300
--vim.o.incsearch = false
vim.wo.signcolumn = 'yes'

vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap=true})

vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', {})

vim.api.nvim_set_keymap('n', 'w', '<Plug>CamelCaseMotion_w', {})
vim.api.nvim_set_keymap('n', 'b', '<Plug>CamelCaseMotion_b', {})
vim.api.nvim_set_keymap('n', 'e', '<Plug>CamelCaseMotion_e', {})

--Replace all is aliased to S.
vim.api.nvim_set_keymap('n', 'S', ':%s//g<Left><Left>', {})
vim.api.nvim_set_keymap('v', 'S', ':s//g<Left><Left>', {})

--Fuzzy find
vim.api.nvim_set_keymap('n', '<C-f>', ':FZF<Cr>', {})

vim.api.nvim_set_keymap('n', '<M-LeftMouse>', '<Plug>(VM-Mouse-Cursor)', {})
vim.api.nvim_set_keymap('i', '<M-LeftMouse>', '<ESC><Plug>(VM-Mouse-Cursor)', {silent=true})
vim.api.nvim_set_keymap('n', '<M-q>', '<Plug>(VM-Add-Cursor-At-Pos)', {})

vim.api.nvim_set_keymap('n', '<C-t>', ':TlistToggle<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeToggle<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>f', ':Neoformat<CR>', {})
vim.api.nvim_set_keymap('v', '<leader>f', ':Neoformat<CR>', {})

vim.g.vimwiki_list = {{path = '~/.local/share/vimwiki/', syntax = 'markdown', ext = '.md', path_html = '~/.local/share/vimwiki_html'}}

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

vim.lsp.set_log_level("off")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>j', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

vim.api.nvim_set_keymap('n', '<leader>ga', ':GeminiApply<CR>', { desc = 'Gemini Action' })
vim.api.nvim_set_keymap('v', '<leader>ge', ':GeminiExplain<CR>', { desc = 'Gemini Explain' })
vim.api.nvim_set_keymap('v', '<leader>gt', ':GeminiTest<CR>', { desc = 'Gemini Test' })

require('gemini').setup({
  -- your custom configuration goes here
  -- For example, to change the model:
  model = "models/gemini-2.5-flash", -- or "models/gemini-pro"
  chat = {
    enabled = true,
  },
  -- See the plugin's documentation for all available options
})


require('vgit').setup({
  keymaps = {
    ['n <C-h>'] = 'hunk_up',
    ['n <C-l>'] = 'hunk_down',
    ['n <leader>gS'] = 'buffer_hunk_stage',
    ['n <leader>gR'] = 'buffer_hunk_reset',
    ['n <leader>gP'] = 'buffer_hunk_preview',
    ['n <leader>gF'] = 'buffer_diff_preview',
    ['n <leader>gH'] = 'buffer_history_preview',
    ['n <leader>gU'] = 'buffer_reset',
    ['n <leader>gG'] = 'buffer_gutter_blame_preview',
    ['n <leader>gLU'] = 'project_hunks_preview',
    ['n <leader>gLS'] = 'project_hunks_staged_preview',
    ['n <leader>gD'] = 'project_diff_preview',
    ['n <leader>gQ'] = 'project_hunks_qf',
    ['n <leader>gX'] = 'toggle_diff_preference',
    ['n <leader>gC'] = 'toggle_live_gutter',
  },
  settings = {
    git = {
      cmd = 'git', -- optional setting, not really required
      fallback_cwd = vim.fn.expand("$HOME"),
      fallback_args = {
        "--git-dir",
        vim.fn.expand("$HOME/dots/yadm-repo"),
        "--work-tree",
        vim.fn.expand("$HOME"),
      },
    },
    hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAdd = {
        gui = nil,
        fg = '#d7ffaf',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsChange = {
        gui = nil,
        fg = '#7AA6DA',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsDelete = {
        gui = nil,
        fg = '#e95678',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false,
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false,
      },
    },
    live_blame = {
      enabled = true,
      format = function(blame, git_config)
        local config_author = git_config['user.name']
        local author = blame.author
        if config_author == author then
          author = 'You'
        end
        local time = os.difftime(os.time(), blame.author_time)
          / (60 * 60 * 24 * 30 * 12)
        local time_divisions = {
          { 1, 'years' },
          { 12, 'months' },
          { 30, 'days' },
          { 24, 'hours' },
          { 60, 'minutes' },
          { 60, 'seconds' },
        }
        local counter = 1
        local time_division = time_divisions[counter]
        local time_boundary = time_division[1]
        local time_postfix = time_division[2]
        while time < 1 and counter ~= #time_divisions do
          time_division = time_divisions[counter]
          time_boundary = time_division[1]
          time_postfix = time_division[2]
          time = time * time_boundary
          counter = counter + 1
        end
        local commit_message = blame.commit_message
        if not blame.committed then
          author = 'You'
          commit_message = 'Uncommitted changes'
          return string.format(' %s • %s', author, commit_message)
        end
        local max_commit_message_length = 255
        if #commit_message > max_commit_message_length then
          commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
        end
        return string.format(
          ' %s, %s • %s',
          author,
          string.format(
            '%s %s ago',
            time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
            time_postfix
          ),
          commit_message
        )
      end,
    },
    live_gutter = {
      enabled = true,
      edge_navigation = true, -- This allows users to navigate within a hunk
    },
    authorship_code_lens = {
      enabled = true,
    },
    scene = {
      diff_preference = 'unified',
    },
    diff_preview = {
      keymaps = {
        buffer_stage = 'S',
        buffer_unstage = 'U',
        buffer_hunk_stage = 's',
        buffer_hunk_unstage = 'u',
        toggle_view = 't',
      },
    },
    project_diff_preview = {
      keymaps = {
        buffer_stage = 's',
        buffer_unstage = 'u',
        buffer_hunk_stage = 'gS',
        buffer_hunk_unstage = 'gU',
        buffer_reset = 'r',
        stage_all = 'S',
        unstage_all = 'U',
        reset_all = 'R',
      },
    },
    signs = {
      priority = 10,
      definitions = {
        GitSignsAddLn = {
          linehl = 'GitSignsAddLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsDeleteLn = {
          linehl = 'GitSignsDeleteLn',
          texthl = nil,
          numhl = nil,
          icon = nil,
          text = '',
        },
        GitSignsAdd = {
          texthl = 'GitSignsAdd',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsDelete = {
          texthl = 'GitSignsDelete',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
        GitSignsChange = {
          texthl = 'GitSignsChange',
          numhl = nil,
          icon = nil,
          linehl = nil,
          text = '┃',
        },
      },
      usage = {
        screen = {
          add = 'GitSignsAddLn',
          remove = 'GitSignsDeleteLn',
        },
        main = {
          add = 'GitSignsAdd',
          remove = 'GitSignsDelete',
          change = 'GitSignsChange',
        },
      },
    },
    symbols = {
      void = '⣿',
    },
  }
})

local nvim_lsp = require('lspconfig')
local util = require("lspconfig/util")
local servers = { 'gopls', 'bashls' }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

nvim_lsp['clangd'].setup{
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = { "clangd", '--clang-tidy' },
    flags = {
      debounce_text_changes = 550,
    },
    root_dir = function(fname)
        return util.root_pattern(".git", "compile_commands.json")(fname) or util.path.dirname(fname)
      end
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    root_dir = function(fname)
        return util.root_pattern(".git", "compile_commands.json")(fname) or util.path.dirname(fname)
      end
  }
end

nvim_lsp['pylsp'].setup {
    capabilities = capabilities,
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
cmp.setup({
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
    --['<Tab>'] = function(fallback)
      --if vim.fn.pumvisible() == 1 then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      --elseif luasnip.expand_or_jumpable() then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      --else
        --fallback()
      --end
    --end,
    --['<S-Tab>'] = function(fallback)
      --if vim.fn.pumvisible() == 1 then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      --elseif luasnip.jumpable(-1) then
        --vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      --else
        --fallback()
      --end
    --end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

--Shortcutting split navigation, saving a keypress:
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})
