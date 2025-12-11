return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "javascript",
        "typescript",
        "tsx", -- Quan trọng cho React
        "json",
        "html", -- Quan trọng cho React
        "yaml", -- Quan trọng cho NestJS config/deploy
      },
      -- *** LOẠI BỎ CSS/SCSS khỏi Treesitter ***
      -- Đảm bảo bạn KHÔNG cài đặt: "css", "scss"
    },
  },
}
