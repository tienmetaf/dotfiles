return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- Ngôn ngữ cốt lõi
      "typescript-language-server", -- TS/JS Language Server
      "html-lsp", -- HTML LSP (cần cho React/JSX)
      "json-lsp",

      -- Formatting (Prettier là chuẩn cho JS/TS)
      "prettier",

      -- Ngôn ngữ cụ thể cho dự án (NestJS)
      "tailwindcss-language-server", -- Nếu bạn có dùng TailwindCSS
    },
    -- *** LOẠI BỎ CSS/SCSS khỏi Installation ***
    -- Đảm bảo bạn KHÔNG cài đặt: "css-lsp", "scss-lsp", "stylelint"
  },
}
