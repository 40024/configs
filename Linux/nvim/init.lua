
--------------------------------------------
---               General                ---
--------------------------------------------

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight selected line
vim.opt.cursorline = true

-- Yank to clipboard not buffer
vim.opt.clipboard = 'unnamedplus'

-- More inclusive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Stay 5 lines below or above current line (matches w VSC)
vim.opt.scrolloff = 5

-- Allow preview of substitute results
vim.opt.inccommand = 'split'

-- Hide default status indicator in favor of lualine
vim.opt.showmode = false


--------------------------------------------
---               Bindings               ---
--------------------------------------------

-- Yank all
if not vim.g.vscode then
  vim.keymap.set('n', '<C-a>', 'maggyG`a', { noremap = true, silent = true })
  vim.keymap.set('i', '<C-a>', 'maggyG`a', { noremap = true, silent = true })
end

-- Quick delete
vim.keymap.set('n', 'X', 'dd', { noremap = true, silent = true })

-- Unbind undo (bound in VSC to VSC buffer instead of separate buffers)
vim.keymap.set('n', 'u', '<Nop>', { noremap = true })

-- Unbind and rebind visual block
vim.keymap.set('i', '<C-v>', '<Nop>')
vim.keymap.set('n', '<S-b>', '<C-v>', { noremap = true, silent = true })
vim.keymap.set('v', '<S-b>', '<C-v>', { noremap = true, silent = true })

-- Easy indent operator pending normal mode hook function
vim.keymap.set('n', '>', function()
  vim.cmd('normal! >>')
end, { noremap = true, silent = true })

vim.keymap.set('n', '<', function()
  vim.cmd('normal! <<')
end, { noremap = true, silent = true })

-- Easy indent visual mode
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })

--------------------------------------------
---          Moonlander Specific         ---
--------------------------------------------

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


--------------------------------------------
---             Functions                ---
--------------------------------------------

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Not sure
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


--------------------------------------------
---                Plugins               ---
--------------------------------------------

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
