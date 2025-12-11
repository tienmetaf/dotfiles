-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Định nghĩa hàm map và tùy chọn chung
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================================================================
-- I. BASIC & NAVIGATION
-- =========================================================================
-- Map: Paste từ Register 0 (Yank Register) - [BEST PRACTICE]
map("n", "<leader>p", '"0p', { desc = "Paste from yank register (0)" }) -- Đã có sẵn noremap, silent trong opts chung

-- Map: Xóa mà không lưu vào Register
map("n", "x", '"_x', { desc = "Delete char, do not yank" })
map("v", "x", '"_x', { desc = "Delete selected, do not yank" })

-- Map: Tăng/Giảm số
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })

-- Map: Chọn toàn bộ file (thay đổi mặc định của <C-a>)
map("n", "<C-a>", "gg<S-v>G", { desc = "Select all contents" })

-- Map: Lưu file và Thoát
map("n", "<Leader>w", ":update<Return>", { desc = "Save file" })
map("n", "<Leader>q", ":quit<Return>", { desc = "Quit current window/buffer" })
map("n", "<Leader>Q", ":qa<Return>", { desc = "Quit ALL buffers" })

-- Map: Code
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
-- =========================================================================
-- II. LSP (Language Server Protocol)
-- =========================================================================

-- Map: Rename (Đổi tên)
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]ename symbol (LSP)" })

-- =========================================================================
-- III. WINDOW/TAB MANAGEMENT & NAVIGATION
-- =========================================================================

-- Map: Chuyển sang Normal Mode trong Terminal
map("t", "<leader><leader>", [[<C-\><C-n>]], { desc = "Switch to Normal Mode in Terminal" })

-- Map: Tabs
map("n", "te", ":tabedit", { desc = "Tab Edit (New tab)" })
map("n", "tw", ":tabclose<Return>", { desc = "Tab Close" })

-- Map: Split window
map("n", "ss", ":split<Return>", { desc = "Split Horizontal" })
map("n", "sv", ":vsplit<Return>", { desc = "Split Vertical" })
