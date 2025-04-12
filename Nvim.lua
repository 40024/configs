
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.inccommand = 'split'

vim.opt.scrolloff = 20

vim.keymap.set("n", "X", "dd", { noremap = true, silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

if vim.g.vscode then
    local opts = { silent = true, noremap = true }

    vim.keymap.set('n', '<C-d>', function()
      vim.fn['vscode#notify']('editorScroll', {
        to = 'down',
        by = 'page',
        value = 1,
        revealCursor = true,
        select = false
      })
    end, opts)

    vim.keymap.set('n', '<C-u>', function()
      vim.fn['vscode#notify']('editorScroll', {
        to = 'up',
        by = 'page',
        value = 1,
        revealCursor = true,
        select = false
      })
    end, opts)
end
