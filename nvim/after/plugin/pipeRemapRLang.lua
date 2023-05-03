--this file is meant to create remapping for the pipe (%>%) operator on R programming files. 
--{lhs} => ">" 
--{rhs) => " %>% "
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"r", "rnoweb"},
    callback = funciton()
      vim.schedule(function()
        vim.keymap.set("i", ">", " %>% ", {buffer = true})
        vim.keymap.set("i", ">>", ">", {buffer = true})
      end)
    end,
})
