-- macOS-only settings. Loaded from xaden/init.lua when running on a Mac.

-- Option+Enter acts like Enter in insert mode.
-- Typing "{" (Option+7 on Turkish Q) and pressing Enter quickly sends Option+Enter.
-- Unmapped, Neovim reads it as <Esc><CR> and leaves insert mode.
-- remap = true so autopairs/completion still see a normal <CR>.
vim.keymap.set("i", "<M-CR>", "<CR>", { remap = true })
