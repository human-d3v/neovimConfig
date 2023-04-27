config=function ()
	require('tabout').setup {
		tabkey = '<Tab>', --key to trigger tabout, set to an empty string to disable
		backwards_tabkey = '<S-Tab>', --key to trigger backwards tabout
		act_as_tab = true, --shift content if tabout isn't possible
		act_as_shift_tab = false, --reverse shift content if tabout isn't possible
		default_tab = '<C-t>', 
		defualt_shift_tab = '<C-d>',
		enable_backwards = true,
		completion = true, 
		tabouts = {
			{open = "'", close = "'"},
			{open = '"', close = '"'},
			{open = "`", close = "`"},
			{open = "(", close = ")"},
			{open = "[", close = "]"},
			{open = "{", close = "}"}
		},
		ignore_beginning = true,
		exclude = {} --input custom filetypes
	}
end
