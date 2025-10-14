
--------------------------------------------
---             Phone only               ---
--------------------------------------------

vim.opt.number = false
vim.opt.relativenumber = false

-- Phone only
vim.opt.wrap = false

-- Phone only
-- Map <leader>q to :q without recording and without changing registers
vim.keymap.set('n', '<leader>q', function()
  -- stop recording if a user started it
  if vim.fn.reg_recording() ~= '' then
    -- if in insert mode, leave it first, then stop recording
    vim.cmd('stopinsert')
    vim.cmd('normal! <Esc>')
    vim.cmd('stoprecording') -- stop recording (avoids changing registers)
  end
  -- finally quit
  vim.cmd('q')
end, { noremap = true, silent = true })
