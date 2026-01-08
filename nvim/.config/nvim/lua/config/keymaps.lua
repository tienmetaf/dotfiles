-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Định nghĩa hàm map và tùy chọn chung
local map = vim.keymap.set
-- =========================================================================
-- I. BASIC & NAVIGATION
-- =========================================================================
-- Map: Xóa mà không lưu vào Register
map("n", "x", '"_x', { desc = "Delete char, do not yank" })
map("v", "x", '"_x', { desc = "Delete selected, do not yank" })
map("v", "p", '"_dP', { desc = "Paste without losing clipboard" })
map("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end, { expr = true, desc = "Smart dd (no yank empty lines)" })

-- Map: Tăng/Giảm số
map("n", "+", "<C-a>", { desc = "Increment number" })
map("n", "-", "<C-x>", { desc = "Decrement number" })

-- Map: Chọn toàn bộ file (thay đổi mặc định của <C-a>)
map("n", "<C-a>", function()
  -- Đảm bảo thực thi chuỗi lệnh ggVG
  vim.cmd("normal! ggVG")
  -- Đảm bảo màn hình được vẽ lại (redraw)
  vim.cmd("redraw!")
end, { desc = "Select all contents (Reliable)", silent = true })

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

-- Normal Mode Keymaps
map("n", "<leader>w=", "<C-W>=", { desc = "Balance all windows" }) -- Cân bằng tất cả cửa sổ

-- Tăng/Giảm chiều cao (Height)
-- Resize (tăng/giảm dòng)
map("n", "<leader>wk", ":resize +3<CR>", { desc = "Increase window height (+3 lines)" })
map("n", "<leader>wj", ":resize -3<CR>", { desc = "Decrease window height (-3 lines)" })

-- Tăng/Giảm chiều rộng (Width)
-- Vertical Resize (tăng/giảm cột)
map("n", "<leader>wl", ":vertical resize +5<CR>", { desc = "Increase window width (+5 cols)" })
map("n", "<leader>wh", ":vertical resize -5<CR>", { desc = "Decrease window width (-5 cols)" })

local function dotnet_new(template)
  return function()
    local name = vim.fn.input(template .. " name: ")
    if name == "" then
      return
    end

    local dir = vim.fn.expand("%:p:h")
    vim.cmd("!dotnet new " .. template .. " -n " .. name .. " -o " .. dir)
    vim.cmd("edit " .. dir .. "/" .. name .. ".cs")
  end
end

map("n", "<leader>nc", dotnet_new("class"), { desc = "New C# class" })
map("n", "<leader>ni", dotnet_new("interface"), { desc = "New C# interface" })
map("n", "<leader>ne", dotnet_new("enum"), { desc = "New C# enum" })
-- map("n", "<leader>ns", dotnet_new("struct"), { desc = "New C# struct" })
map("n", "<leader>nr", dotnet_new("record"), { desc = "New C# record" })

local function dotnet_new_project(template, entry_file_fn)
  return function()
    local name = vim.fn.input(template .. " project name: ")
    if name == "" then
      return
    end

    vim.cmd("!dotnet new " .. template .. " -n " .. name)

    if entry_file_fn then
      local file = entry_file_fn(name)
      vim.cmd("edit " .. file)
    end
  end
end

-- console
map(
  "n",
  "<leader>npc",
  dotnet_new_project("console", function(name)
    return name .. "/Program.cs"
  end),
  { desc = "New console project" }
)

-- classlib
map(
  "n",
  "<leader>npl",
  dotnet_new_project("classlib", function(name)
    return name .. "/Class1.cs"
  end),
  { desc = "New class library project" }
)

-- web
map(
  "n",
  "<leader>npw",
  dotnet_new_project("web", function(name)
    return name .. "/Program.cs"
  end),
  { desc = "New ASP.NET Core web project" }
)

-- webapi
map(
  "n",
  "<leader>npa",
  dotnet_new_project("webapi", function(name)
    return name .. "/Program.cs"
  end),
  { desc = "New ASP.NET Core Web API project" }
)

-- xunit
map(
  "n",
  "<leader>npx",
  dotnet_new_project("xunit", function(name)
    return name .. "/UnitTest1.cs"
  end),
  { desc = "New xUnit test project" }
)

map("n", "<leader>ns", function()
  local name = vim.fn.input("Solution name: ")
  if name == "" then
    return
  end

  vim.cmd("!dotnet new sln -n " .. name)
end, { desc = "New solution" })
