local keymap = vim.keymap
local format = require("util.icons").format
local opts = { noremap = true, silent = true }

-- File operation
opts.desc = format("Save", "Save")
keymap.set("n", "<leader>w", ":w<CR>", opts)

opts.desc = format("Exit", "Quit")
keymap.set("n", "<leader>q", ":q<CR>", opts)

-- Pane navigation
opts.desc = format("Left", "Left window")
keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate Left

opts.desc = format("Down", "Down window")
keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate Down

opts.desc = format("Up", "Up window")
keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate Up

opts.desc = format("Right", "Right window")
keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate Right

-- Directory Navigation
opts.desc = format("FileTree", "File explorer")
keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", opts)

opts.desc = format("FileTree", "Open File explorer")
keymap.set("n", "<leader>o", ":NvimTreeOpen<CR>", opts)

-- Buffer navigation
opts.desc = format("Swap", "Pick buffer")
keymap.set("n", "<leader>p", ":BufferLinePick<CR>", opts)

-- Window management
opts.desc = format("Vertical", "Split Window Vertically")
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically

opts.desc = format("Horizontal", "Split Window Horizontally")
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally

opts.desc = format("Window", "Increase height")
keymap.set("n", "<leader>+", "<C-w>+", opts)

opts.desc = format("Window", "Decrease height")
keymap.set("n", "<leader>-", "<C-w>-", opts)

-- Indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Comments
opts.desc = format("Toggle", "Toggle Comment line")
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
opts.desc = format("Toggle", "Toggle Comment Block")
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Terminal
opts.desc = format("Terminal", "Terminal")
keymap.set("n", "<leader>t", ":ToggleTerm<CR>", opts)

-- Lazygit
opts.desc = format("Git", "Lazygit")
keymap.set("n", "<leader>lg", ":LazyGit<CR>", opts)

-- I don't have <> touch on my PC keyboard
opts.desc = format("Edit", "Insert <")
vim.api.nvim_set_keymap("i", "<C-b>,", "<", opts)

opts.desc = format("Edit", "Insert >")
vim.api.nvim_set_keymap("i", "<C-b>;", ">", opts)
