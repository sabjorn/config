local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'wbthomason/packer.nvim',

    -- General plugins
    'VonHeikemen/lsp-zero.nvim',
    'neovim/nvim-lspconfig',
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup{
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "clangd",
                    "pyright",
                    "pylsp",
                },
            }
        end,
    },
    {
        'w0rp/ale',
        config = function()
            vim.g.ale_fix_on_save = 1
            vim.g.ale_linters = {
                --python = {'flake8', 'black', 'mypy'},
                python = {'black', 'mypy'},
                c = {'clang', 'clangtidy'},
                cpp = {'clang', 'clangtidy'},
                bash = {'shellcheck'},
            }
            vim.g.ale_fixers = {
                python = {'black'},
                c = {'clang-format', 'clangtidy'},
                cpp = {'clang-format', 'clangtidy'},
                bash = {'shfmt'},
            }
            vim.g.ale_sign_error = '✗'
            vim.g.ale_sign_warning = '⚠'
            vim.g.ale_sign_info = 'ℹ'
            vim.g.ale_sign_style_error = '✗'
            vim.g.ale_sign_style_warning = '⚠'
            vim.g.ale_sign_style_info = 'ℹ'
            vim.g.ale_echo_msg_error_str = '✗'
            vim.g.ale_echo_msg_warning_str = '⚠'
            vim.g.ale_echo_msg_info_str = 'ℹ'
            vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
            vim.g.ale_lint_on_insert_leave = 1
            vim.g.ale_lint_on_insert = 0
            vim.g.ale_lint_on_text_changed = 'never'
            vim.g.ale_lint_on_enter = 0
            vim.g.ale_lint_on_filetype_changed = 0
            vim.g.ale_lint_on_save = 0
            vim.g.ale_lint_on_cursor_hold = 0
            vim.g.ale_lint_on_cursor_moved = 0
            vim.g.ale_lint_on_insert = 0
        end
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = {
                  'cmake-language-server',
                  'lua-language-server',
                  'bash-language-server',
                },
                auto_update = true,
            }
        end,
    },
    'onsails/lspkind.nvim',
    'VonHeikemen/lsp-zero.nvim',

    'airblade/vim-gitgutter',
    'lervag/vimtex',
    'scrooloose/nerdtree',
    --'nvim-tree/nvim-tree.lua' -- replace nerdtree TODO
    --'folke/todo-comments.nvim', -- search TODO, maybe eventually
    {
        'nvim-treesitter/nvim-treesitter',
        tag = "v0.9.2",
    },
    'tree-sitter/tree-sitter-python',
    -- 'folke/trouble.nvim' -- learn how to config
 
    -- autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',

    -- run with :BlamerToggle
    'APZelos/blamer.nvim',

    -- Looks
    'frazrepo/vim-rainbow',
    'joshdick/onedark.vim',
    'vim-airline/vim-airline',
    'kyazdani42/nvim-web-devicons',

    -- C++
    --{'neoclide/coc.nvim', branch = 'release'},
    
    -- Debugging 
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
    'mfussenegger/nvim-dap-python',

    -- Telescope
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
    'BurntSushi/ripgrep',

    -- Misc
    'ThePrimeagen/vim-be-good',
    'glacambre/firenvim',
})

