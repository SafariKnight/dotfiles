local servers = {
	["lua_ls"] = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
	-- ["rust_analyzer"] = {},
	["pyright"] = {},
	["tsserver"] = {},
	["html"] = {},
	["cssls"] = {},
	["gopls"] = {},
}
local servers_key = vim.tbl_keys(servers)
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "folke/neodev.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = servers_key } },
			{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
			"hrsh7th/cmp-nvim-lsp",
			"RRethy/vim-illuminate",
		},
		opts = {
			-- vim.diagnostic.config()
			virtual_text = true,
			update_in_insert = true,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		},
		config = function(_, opts)
			vim.diagnostic.config(opts)
			local lspconf = require("lspconfig")
			-- Diagnostics (Copied from lazyvim sorry folke)
			for name, icon in pairs(require("utils").icons.diagnostics) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end
			for server, server_opts in pairs(servers) do
				server_opts = vim.tbl_deep_extend("force", server_opts, {
					-- capabilities = require("cmp_nvim_lsp").default_capabilities(),
					capabilities = require("utils.lsp").capabilities,
					on_attach = require("utils.lsp").on_attach,
				})
				-- print(vim.inspect(opts))
				lspconf[server].setup(server_opts)
			end
			local nls = require("null-ls")
			local builtin = nls.builtins
			nls.setup({
				sources = {
					builtin.formatting.stylua,
					builtin.formatting.rustfmt,
          builtin.formatting.gofmt
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local icons = require("utils").icons.kinds
			local t = function(str)
				return vim.api.nvim_replace_termcodes(str, true, true, true)
			end
			return {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-y>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-n>"] = cmp.mapping({
						c = function()
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								vim.api.nvim_feedkeys(t("<Down>"), "n", true)
							end
						end,
						i = function(fallback)
							if cmp.visible() then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								fallback()
							end
						end,
					}),
					["<C-p>"] = cmp.mapping({
						c = function()
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
							else
								vim.api.nvim_feedkeys(t("<Up>"), "n", true)
							end
						end,
						i = function(fallback)
							if cmp.visible() then
								cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
							else
								fallback()
							end
						end,
					}),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				-- formatting = {
				-- 	format = function(_, vim_item)
				-- 		vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				-- 		return vim_item
				-- 	end,
				-- },
				formatting = {
					fields = { "abbr", "kind" },
					format = function(_, vim_item)
						vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind) or ""
						return vim_item
					end,
				},
			}
		end,
	},
}
