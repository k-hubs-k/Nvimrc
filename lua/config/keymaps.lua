local keymap = vim.keymap
local format = require("util.icons").format
local opts = { noremap = true, silent = true }

-- File operation
opts.desc = format("Save", "Save the current file")
keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

opts.desc = format("Exit", "Quit")
keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true })

-- Pane navigation
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

-- Directory Navigation
opts.desc = format("FileTree", "File explorer")
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

opts.desc = format("FileTree", "Open File explorer")
keymap.set("n", "<leader>o", ":NvimTreeOpen<CR>", opts)

-- Window management
opts.desc = format("Vertical", "Split Window Vertically")
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically
opts.desc = format("Horizontal", "Split Window Horizontally")
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
opts.desc = format("Toggle", "Toggle Comment line")
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
opts.desc = format("Toggle", "Toggle Comment Block")
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- I don't have <> touch on my PC keyboard
opts.desc = "Insert <"
vim.api.nvim_set_keymap("i", "<C-b>,", "<", opts)
opts.desc = "Insert >"
vim.api.nvim_set_keymap("i", "<C-b>;", ">", opts)
