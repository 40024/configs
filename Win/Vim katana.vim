vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
    end
})
