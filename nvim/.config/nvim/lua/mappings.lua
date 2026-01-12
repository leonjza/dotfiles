require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- COPY (Cmd–C)
map({ "v", "x" }, "<D-c>", '"+y', opts)  -- Copy visual selection to system clipboard
map("n", "<D-c>", '"+yy', opts)          -- Copy current line to system clipboard

-- PASTE (Cmd–V)
map("n", "<D-v>", '"+p', opts)           -- Paste after cursor in Normal mode
map("x", "<D-v>", '"+p', opts)           -- Replace selection with system clipboard
map("n", "<D-S-v>", '"+P', opts)         -- Paste before cursor (Cmd–Shift–V)
map("i", "<D-v>", '<C-r>+', opts)        -- Paste in Insert mode
map("t", "<D-v>", [[<C-\><C-n>"+pa]], opts) -- Paste in Terminal mode
