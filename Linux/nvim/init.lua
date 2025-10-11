
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.inccommand = 'split'

vim.opt.scrolloff = 10

vim.keymap.set('n', 'X', 'dd', { noremap = true, silent = true })
vim.keymap.set('i', '<C-v>', '<Nop>')
vim.keymap.set('n', 'W', 'M', { noremap = true })
vim.keymap.set('n', 'u', '<Nop>', { noremap = true })

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

-- Remap hjkl to jklp in normal mode
vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'p', 'l', { noremap = true, silent = true })

-- Remap hjkl to jklp in visual mode
vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'l', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'p', 'l', { noremap = true, silent = true })

-- Normal mode: ; → p, Shift-; (:) → P
vim.keymap.set('n', ';', 'p', { noremap = true, silent = true })

-- Visual mode: ; → p, Shift-; (:) → P
vim.keymap.set('v', ';', 'p', { noremap = true, silent = true })

-- Lualine; git clone github.com/nvim-lualine/lualine.nvim.git ~/.local/share/nvim/site/pack/lualine/start/lualine.nvim
require('lualine').setup {
  options = {
    theme = 'horizon',
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {}, 
    lualine_c = {},             
    lualine_x = {},             
    lualine_y = {},             
    lualine_z = {},   
  },
}

-- Flash; git clone https://github.com/folke/flash.nvim.git ~/.local/share/nvim/site/pack/flash/start/flash.nvim
require("flash").setup()
vim.keymap.set("n", "s", function() require("flash").jump() end)

-- Hide default status indicator in favor of lualine
vim.opt.showmode = false

vim.keymap.set('n', '>', '>>', { noremap = true })
vim.keymap.set('v', '>', '>>', { noremap = true })
vim.keymap.set('n', '<', '<<', { noremap = true })
vim.keymap.set('v', '<', '<<', { noremap = true })
