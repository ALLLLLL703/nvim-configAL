require("avante").setup({
	providers = {
		deepseek = {
			__inherited_from = "openai",
			api_key_name = "DEEPSEEK_API_KEY",
			endpoint = "https://api.deepseek.com",
			model = "deepseek-coder",
			max_tokens = 8192,
		},

		claude = {
			endpoint = "https://api.minimax.io/anthropic",
			model = "MiniMax-M2.1",
			timeout = 30000,
			max_tokens = 8192,
		},
	},
})
