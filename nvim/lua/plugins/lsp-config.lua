return {
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"pyright",
					"pylsp",
                    "rust_analyzer",
                    "ts_ls"
				},
				auto_install = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({
				capabilities = capabilities,
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						autoImportCompletions = true,
					},
					--pythonPath = vim.fn.getcwd() .. "/venv/bin/python3",
					pythonPath = vim.fn.getcwd() .. '~/micro-services/venv/bin/python',
                    --
				},
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
            lspconfig.rust_analyzer.setup({
               capabilities = capabilities,
               settings = {
                 ["rust-analyzer"] = {
                   cargo = {
                     allFeatures = true,
                   },
                   procMacro = {
                     enable = true,
                   },
                 },
               },
            })

            lspconfig.ts_ls.setup({
                 on_attach = function(client, bufnr)
                   vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                 end,
                settings = {
                    typescript = {
                      inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                      }
                    },
                    javascript = {
                      inlayHints = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                      }
                    }
                  }
            })

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "D", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gn", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', function()
                require('telescope.builtin').lsp_references({ jump_type = "never" })
            end, {silent = true})
            --vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("i", "<leader>h", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", 'gh', '<cmd>ClangdSwitchSourceHeader<cr>')

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
			    vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
				end,
			})
		end,
	},
}
