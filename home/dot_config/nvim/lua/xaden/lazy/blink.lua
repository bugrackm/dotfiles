return {
	{
		"saghen/blink.cmp",
		version = "*",
		build = function()
			require("blink.cmp").build():pwait()
		end,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saghen/blink.lib",
		},
		-- Calm mode (default): no popup while typing, no ghost text, no auto docs.
		-- Ctrl+Space opens suggestions; Tab only accepts when the menu is open.
		-- <leader>tc toggles calm/full mode.
		init = function()
			if vim.g.cmp_calm == nil then
				vim.g.cmp_calm = true
			end
			vim.keymap.set("n", "<leader>tc", function()
				vim.g.cmp_calm = not vim.g.cmp_calm
				require("blink.cmp.config").completion.documentation.auto_show = not vim.g.cmp_calm
				vim.notify("Completion: " .. (vim.g.cmp_calm and "calm" or "full"))
			end, { desc = "Toggle calm completion" })
		end,
		opts = {
			keymap = {
				preset = "super-tab",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = {
					auto_show = function()
						return not vim.g.cmp_calm
					end,
				},
				-- Boolean only; the <leader>tc toggle flips it at runtime.
				documentation = { auto_show = false, auto_show_delay_ms = 200 },
				ghost_text = {
					enabled = function()
						return not vim.g.cmp_calm
					end,
				},
			},
			snippets = {
				preset = "default",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					snippets = {
						opts = {
							search_paths = { vim.fn.stdpath("config") .. "/snippets" },
						},
					},
				},
			},
			signature = { enabled = true },
		},
	},
}
