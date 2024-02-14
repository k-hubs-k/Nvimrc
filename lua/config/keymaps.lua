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

-- Top Search
opts.desc = format("Stop", "Stop research")
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", opts)

-- Directory Navigation
opts.desc = format("FileTree", "File explorer")
keymap.set("n", "<leader>h", ":NvimTreeToggle<CR>", opts)

opts.desc = format("FileTree", "Open File explorer")
keymap.set("n", "<leader>o", ":NvimTreeOpen<CR>", opts)

-- Buffer navigation
opts.desc = format("Swap", "Pick buffer")
keymap.set("n", "<leader>p", ":BufferLinePick<CR>", opts)

opts.desc = format("Close", "Close window")
keymap.set("n", "<leader>b", ":BufferLinePickClose<CR>", opts)

-- word movement
keymap.set({ "n", "i" }, "<A-l>", "<ESC>:MoveWord 1<CR>", opts)
keymap.set({ "n", "i" }, "<A-h>", "<ESC>:MoveWord -1<CR>", opts)

-- Window management
opts.desc = format("Vertical", "Split Window Vertically")
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split Vertically

opts.desc = format("Horizontal", "Split Window Horizontally")
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split Horizontally

opts.desc = format("Window", "Increase height")
keymap.set("n", "<leader>+", "<C-w>+", opts)

opts.desc = format("Window", "Decrease height")
keymap.set("n", "<leader>-", "<C-w>-", opts)

opts.desc = format("Window", "Increase width")
keymap.set("n", "<leader>>", "<C-w>5>", opts)

opts.desc = format("Window", "Decrease width")
keymap.set("n", "<leader><", "<C-w>5<", opts)

-- Selection
keymap.set("n", "<C-a>", "ggVG", opts)

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

-- Toggle value
opts.desc = format("Toggle", "Toggle value")
keymap.set("n", "<leader>T", ":ToggleAlternate<CR>", opts)

-- I don't have <> touch on my PC keyboard
opts.desc = format("Edit", "Insert <")
vim.api.nvim_set_keymap("i", "<C-b>,", "<", opts)

opts.desc = format("Edit", "Insert >")
vim.api.nvim_set_keymap("i", "<C-b>;", ">", opts)

-- Session manager
opts.desc = format("Save", "Save session")
keymap.set("n", "<leader>Ss", ":SessionManager save_current_session<CR>", opts)

opts.desc = format("Restore", "Load session")
keymap.set("n", "<leader>Sl", ":SessionManager load_session<CR>", opts)

opts.desc = format("Save", "Load last session")
keymap.set("n", "<leader>SL", ":SessionManager load_last_session<CR>", opts)

opts.desc = format("Trash", "Delete session")
keymap.set("n", "<leader>Sd", ":SessionManager delete_session<CR>", opts)

opts.desc = format("FolderClock", "Load current directory session")
keymap.set("n", "<leader>Sd", ":SessionManager load_curent_dir_session<CR>", opts)

-- utils
opts.desc = "Mason"
keymap.set("n", "<leader>M", ":Mason<CR>", opts)

opts.desc = "Lazy"
keymap.set("n", "<leader>L", ":Lazy<CR>", opts)
