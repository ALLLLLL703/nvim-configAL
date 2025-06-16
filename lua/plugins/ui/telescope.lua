return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local tele_actions = require("telescope.actions")
			local lga_actions = require("telescope-live-grep-args.actions")
			local lga_shortcuts = require("telescope-live-grep-args.shortcuts")
			local undo_actions = require("telescope-undo.actions")
			require('telescope').load_extension('projects')
			telescope.setup({
				defaults = {
					layout_config = {
						anchor = "center",
						height = 0.8,
						width = 0.9,
						preview_width = 0.6,
						prompt_position = "bottom",
					},
					mappings = {
						i = {
							["<esc>"] = tele_actions.close,
						},
					},
				},
				extensions = {
					undo = {
						use_delta = true,
						side_by_side = true,
						entry_format = "󰣜  #$ID, $STAT, $TIME",
						layout_strategy = "flex",
						mappings = {
							i = {
								["<cr>"] = undo_actions.yank_additions,
								["<c-\\>"] = undo_actions.yank_deletions,
								["§"] = undo_actions.restore, -- term mapped to shift+enter
							},
						},
					},
					live_grep_args = {
						auto_quoting = true,
						mappings = {
							i = {
								["<c-\\>"] = lga_actions.quote_prompt({ postfix = " --hidden " }),
							},
						},
					},
					file_browser = {
						depth = 1,
						auto_depth = false,
						hidden = { file_browser = true, folder_browser = true },
						hide_parent_dir = false,
						collapse_dirs = false,
						prompt_path = false,
						quiet = false,
						dir_icon = "󰉓 ",
						dir_icon_hl = "Default",
						display_stat = { date = true, size = true, mode = true },
						git_status = true,
					},
				},
			})
			telescope.load_extension("undo")
			telescope.load_extension("file_browser")
			telescope.load_extension("live_grep_args")
			local status_ok, telescope = pcall(require, "telescope")
			if not status_ok then
				return

			end


			local actions = require("telescope.actions")
			require('telescope').setup {
				defaults = {
					-- Default configuration for telescope goes here:
					-- config_key = value,

					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },


					mappings = {
						i = {
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,

							["<C-c>"] = actions.close,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,

							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},

						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

							["j"] = actions.move_selection_next,
							["k"] = actions.move_selection_previous,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,

							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,

							["<C-u>"] = actions.preview_scrolling_up,
							["<C-d>"] = actions.preview_scrolling_down,

							["<PageUp>"] = actions.results_scrolling_up,
							["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					}
				},
				pickers = {
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_ key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
				extensions = {
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					-- please take a look at the readme of the extension you want to configure
				}
			}
			vim.keymap.set('n','<leader>fp',require('telescope').extensions.projects.projects{},{desc = 'Find Projects'})

		end,
	}
}
