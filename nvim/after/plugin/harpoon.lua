local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set('n','<leader>a',mark.add_file)

--harpoon menu appears when you type ctrl + e
vim.keymap.set('n','<C-e>',ui.toggle_quick_menu)
--with the menu onscreen, map functions for navigation
  vim.keymap.set('n','<C-h>',function() ui.nav_file(1) end) --h for first
  vim.keymap.set('n','<C-t>',function() ui.nav_file(2) end) --t for second
  vim.keymap.set('n','<C-n>',function() ui.nav_file(3) end) --n for third
  vim.keymap.set('n','<C-s>',function() ui.nav_file(4) end) --s for last
  
