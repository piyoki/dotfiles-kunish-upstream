local M = {}

function M.setup()
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    M.packer_bootstrap = vim.fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    })
  end

  local packer = require('packer')

  packer.startup({
    function(use)
      -- essential
      use('wbthomason/packer.nvim')
      use('nvim-lua/plenary.nvim')
      use('rktjmp/lush.nvim')

      -- interface
      use({
        'kyazdani42/nvim-web-devicons',
        config = function()
          require('nvim-web-devicons').setup({ default = true })
        end,
      })
      use({
        'ellisonleao/gruvbox.nvim',
        config = function()
          vim.cmd([[colorscheme gruvbox]])
        end,
      })
      use('Shatur/neovim-ayu')
      use({
        'lewis6991/gitsigns.nvim',
        config = function()
          require('gitsigns').setup({
            yadm = {
              enable = true,
            },
          })
        end,
      })
      use({
        'kyazdani42/nvim-tree.lua',
        config = function()
          require('nvim-tree').setup({
            view = {
              width = 40,
              auto_resize = true,
              hide_root_folder = true,
            },
            hijack_cursor = true,
            update_focused_file = {
              enable = true,
            },
            git = {
              ignore = false,
            },
            filters = {
              custom = { '.git' },
            },
          })
        end,
      })
      use({
        'nvim-lualine/lualine.nvim',
        config = function()
          require('lualine').setup({
            extensions = { 'nvim-tree', 'fugitive', 'quickfix' },
          })
        end,
      })
      use({
        'akinsho/bufferline.nvim',
        config = function()
          require('bufferline').setup({
            options = {
              offsets = {
                {
                  filetype = 'NvimTree',
                  text = 'File Explorer',
                  highlight = 'Directory',
                  text_align = 'left',
                },
              },
            },
          })
        end,
      })
      use({
        'norcalli/nvim-colorizer.lua',
        config = function()
          require('colorizer').setup(nil, {
            RRGGBBAA = true,
            css = true,
            css_fn = true,
            rgb_fn = true,
            hsl_fn = true,
          })
        end,
      })

      -- tool
      use({
        'phaazon/hop.nvim',
        config = function()
          require('hop').setup()
        end,
      })
      use({
        'windwp/nvim-autopairs',
        config = function()
          require('nvim-autopairs').setup({
            check_ts = true,
          })
        end,
      })
      use({
        'max397574/better-escape.nvim',
        config = function()
          require('better_escape').setup({
            timeout = 250,
          })
        end,
      })
      use({
        'numToStr/Navigator.nvim',
        config = function()
          require('Navigator').setup()
        end,
      })
      use({
        'mattn/emmet-vim',
        config = function()
          vim.g.user_emmet_expandabbr_key = '<C-z>'
          vim.g.user_emmet_mode = 'i'
        end,
      })
      use({
        'folke/which-key.nvim',
        config = function()
          require('which-key').setup()
        end,
      })
      use({
        'mbbill/undotree',
        config = function()
          vim.g.undotree_SetFocusWhenToggle = 1
          vim.g.undotree_HelpLine = 0
        end,
      })
      use({
        'nvim-pack/nvim-spectre',
        config = function()
          require('spectre').setup()
        end,
      })
      use('famiu/bufdelete.nvim')
      use('tpope/vim-surround')
      use('vim-scripts/ReplaceWithRegister')
      use('houtsnip/vim-emacscommandline')
      use('numToStr/Comment.nvim')
      use('tpope/vim-fugitive')
      use('tpope/vim-repeat')

      -- telescope
      use({
        'nvim-telescope/telescope.nvim',
        config = function()
          require('telescope').setup({
            defaults = require('telescope.themes').get_ivy(),
            pickers = {
              find_files = {
                find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
              },
            },
          })
        end,
      })

      -- treesitter
      use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
          'nvim-treesitter/nvim-treesitter-textobjects',
          'JoosepAlviste/nvim-ts-context-commentstring',
        },
        config = function()
          require('nvim-treesitter.install').prefer_git = true
          require('nvim-treesitter.configs').setup({
            ensure_installed = 'maintained',
            autopairs = { enable = true },
            highlight = { enable = true },
            indent = { enable = true, disable = { 'python' } },
            context_commentstring = { enable = true, enable_autocmd = false },
            textobjects = {
              select = {
                enable = true,
                lookahead = true,
                keymaps = {
                  ['af'] = '@function.outer',
                  ['if'] = '@function.inner',
                  ['ac'] = '@class.outer',
                  ['ic'] = '@class.inner',
                },
              },
            },
          })
        end,
      })

      -- ide
      use({
        'neovim/nvim-lspconfig',
        requires = {
          'williamboman/nvim-lsp-installer',
          'jose-elias-alvarez/null-ls.nvim',
          'folke/lua-dev.nvim',
          'b0o/schemastore.nvim',
        },
      })

      -- cmp
      use({
        'hrsh7th/nvim-cmp',
        requires = {
          'onsails/lspkind-nvim',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lsp',
          'L3MON4D3/LuaSnip',
          'saadparwaiz1/cmp_luasnip',
          'rafamadriz/friendly-snippets',
        },
      })

      if M.packer_bootstrap then
        packer.sync()
      end
    end,
  })
end

return M
