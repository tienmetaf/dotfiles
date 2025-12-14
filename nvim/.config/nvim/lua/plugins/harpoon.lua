return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,

  -- Dùng `keys` của LazyVim để quản lý phím tắt
  keys = function()
    local harpoon = require("harpoon")

    return {
      -- Phím cơ bản
      {
        "<leader>a",
        function()
          harpoon:list():add()
        end,
        desc = "Harpoon Add File",
      },
      {
        "<C-e>",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Menu",
      },

      -- GHI ĐÈ Shift + h/l
      {
        "<S-h>",
        function()
          harpoon:list():prev()
        end,
        desc = "Harpoon Prev",
        mode = "n", -- Chỉ hoạt động ở Normal mode
      },
      {
        "<S-l>",
        function()
          harpoon:list():next()
        end,
        desc = "Harpoon Next",
        mode = "n",
      },

      -- Phím số (Alt + 1,2,3,4)
      {
        "<M-1>",
        function()
          harpoon:list():select(1)
        end,
        desc = "Harpoon 1",
      },
      {
        "<M-2>",
        function()
          harpoon:list():select(2)
        end,
        desc = "Harpoon 2",
      },
      {
        "<M-3>",
        function()
          harpoon:list():select(3)
        end,
        desc = "Harpoon 3",
      },
      {
        "<M-4>",
        function()
          harpoon:list():select(4)
        end,
        desc = "Harpoon 4",
      },
    }
  end,
}
