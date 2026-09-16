return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			-- nvim 0.11+: configure servers with vim.lsp.config, start them with
			-- vim.lsp.enable. nvim-lspconfig ships the base config in its lsp/ dir;
			-- what we set here is merged on top of it.
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							autoImportCompletions = true,
						},
						--pythonPath = vim.fn.expand("~/micro-services/venv/bin/python"),
					},
				},
			})

			vim.lsp.config("lua_ls", {})

			vim.lsp.config("rust_analyzer", {
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

			local ts_inlay_hints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}

			vim.lsp.config("ts_ls", {
				on_attach = function(_, bufnr)
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end,
				settings = {
					typescript = { inlayHints = ts_inlay_hints },
					javascript = { inlayHints = ts_inlay_hints },
				},
			})

			vim.lsp.enable({ "pyright", "lua_ls", "rust_analyzer", "ts_ls" })

			vim.keymap.set("n", "gd", function()
				require("telescope.builtin").lsp_definitions({ jump_type = "never" })
			end, { silent = true })
			vim.keymap.set("n", "gr", function()
				require("telescope.builtin").lsp_references({ jump_type = "never" })
			end, { silent = true })
			vim.keymap.set("n", "D", vim.lsp.buf.hover)
			vim.keymap.set("n", "gn", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end)
			vim.keymap.set("n", "gp", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end)
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
			vim.keymap.set("i", "<leader>h", vim.lsp.buf.signature_help)
			vim.keymap.set("n", "gh", "<cmd>ClangdSwitchSourceHeader<cr>")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = ev.buf })
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
				},
				automatic_enable = true,
			})
		end,
	},
}
