vim.keymap.set("n", "<leader>ex",vim.cmd.Ex)
vim.keymap.set("n", "<leader>ps",":PackerSync")

--move visual blocks while retaining data
vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv") --move up
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv") --move down


vim.keymap.set('n', "Y", "yg$")

--allows you to append lines from below to your current line without moving your cursor to the end of the file
vim.keymap.set('n', "J", "mzJ`z") 

--<C-d> and <C-u> allow for half page jumping, this remap keeps your cursor at the center of the screen when scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', "<C-u>zz")

--allows for searching in the middle of the screen. 
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

--deletes highlighted word and replaces it with value in p while placing deleted value in void register
--this helps to retain the value in p for future putting
vim.keymap.set("x", "<leader>p", "\"_dp")

--these move the yanked values from nvim the register to system clipboard for pasting outside of vim
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-c>", "<Esc>")

--don't ever press Q. It's the worst place in the universe. 
vim.keymap.set("n", "Q", "<nop>")

--create a new tmux session for switching projects quickly. 
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

--lsp quick format
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)

--quickfix list navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

--replacing every instance (similar to <C-F2> in vscode)
vim.keymap.set("n", "<leader>s", ":s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {silent = true})

--for Terminal Navigation (the noremap option is really important, otherwise it fails)
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], {silent = true, noremap=true})
