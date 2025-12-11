-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- =========================================================================
-- BASIC & GLOBAL OPTIONS
-- =========================================================================
vim.g.mapleader = " " -- [1] Thiết lập phím Leader là phím cách
vim.opt.encoding = "utf-8" -- [2] Mã hóa bên trong Vim là UTF-8
vim.opt.fileencoding = "utf-8" -- [3] Mã hóa khi lưu file là UTF-8

vim.opt.winbar = "%=%m %f" -- Hiển thị tên file ở góc trên bên phải

-- =========================================================================
-- EDITING & DISPLAY OPTIONS
-- =========================================================================
vim.opt.number = true -- [4] Hiển thị số dòng tuyệt đối
vim.opt.relativenumber = true -- [5] Hiển thị số dòng tương đối
vim.opt.termguicolors = true -- [6] Kích hoạt màu sắc 24-bit
vim.opt.cursorline = true -- [7] Làm nổi bật dòng hiện tại
vim.opt.signcolumn = "yes" -- [8] Luôn hiển thị cột Sign Column
vim.opt.cmdheight = 1 -- [9] Chiều cao Command Line
vim.opt.laststatus = 3 -- [10] Luôn hiển thị Status Line
vim.opt.scrolloff = 8 -- [11] Đệm dòng khi cuộn
vim.opt.splitbelow = true -- [12] Split ngang mở ở dưới
vim.opt.splitright = true -- [13] Split dọc mở ở bên phải
vim.opt.mouse = "a" -- [14] Kích hoạt hỗ trợ chuột

-- =========================================================================
-- INDENTATION & TABS
-- =========================================================================
vim.opt.expandtab = true -- [15] Chuyển Tab thành Space
vim.opt.shiftwidth = 2 -- [16] Chiều rộng của thụt lề (indentation)
vim.opt.tabstop = 2 -- [17] Độ rộng của ký tự Tab
vim.opt.autoindent = true -- [18] Tự động thụt lề
vim.opt.smartindent = true -- [19] Thụt lề thông minh
vim.opt.smarttab = true -- [20] Thụt lề sử dụng shiftwidth

-- =========================================================================
-- Support Copy Paste on Windows and WSL
-- =========================================================================
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.opt.clipboard = "unnamedplus"

-- WSL Clipboard support (dùng win32yank.exe đã cài ở Bước 1)
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

-- =========================================================================
-- SEARCHING & FILE MANAGEMENT
-- =========================================================================
vim.opt.ignorecase = true -- [21] Bỏ qua phân biệt chữ hoa/thường khi tìm kiếm
vim.opt.smartcase = true -- [22] Phân biệt chữ hoa/thường thông minh
vim.opt.hlsearch = true -- [23] Làm nổi bật kết quả tìm kiếm
vim.opt.inccommand = "split" -- [24] Preview lệnh thay thế
vim.opt.wrap = false -- [25] Tắt wrap (không tự động xuống dòng)
vim.opt.backspace = { "start", "eol", "indent" } -- [26] Xóa bằng backspace mượt mà
vim.opt.undofile = true -- [27] Kích hoạt lưu lịch sử Undo
vim.opt.swapfile = false -- [28] Tắt file swap
vim.opt.backup = false -- [29] Tắt file backup
vim.opt.updatetime = 300 -- [30] Giảm thời gian chờ cho LSP
vim.opt.isfname:append("@-@") -- [31] Cải thiện nhận diện tên file (ví dụ: `test-component.tsx`)
