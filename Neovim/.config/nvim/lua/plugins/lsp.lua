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
			"jose-elias-alvarez/null-ls.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"RRethy/vim-illuminate",
		},
		opts = {
			-- vim.diagnostic.config()
			virtual_text = false,
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
			local on_attach = function(client, bufnr)
				require("utils.map").load_mapping("lspconfig", { buffer = bufnr })

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format current buffer with LSP" })
				require("illuminate").on_attach(client)
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			for server, opts in pairs(servers) do
				opts = vim.tbl_deep_extend("force", opts, {
					capabilities = capabilities,
					on_attach = on_attach,
				})
				lspconf[server].setup(opts)
			end
			local nls = require("null-ls")
			local builtin = nls.builtins
			nls.setup({
				sources = {
					builtin.formatting.stylua,
					builtin.formatting.rustfmt,
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
			local kind_icons = {
				Text = "",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰂡",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			}
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
					["<C-Space>"] = cmp.mapping.complete(),
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
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = function(_, vim_item)
						vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
						return vim_item
					end,
				},
			}
		end,
	},
}