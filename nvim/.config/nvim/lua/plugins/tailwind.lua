return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    lspconfig.tailwindcss.setup({
      -- 1. Command settings
      cmd = { "tailwindcss-language-server", "--stdio" },

      -- 2. Your custom filetypes (Including .NET/Razor)
      filetypes = {
        "aspnetcorerazor",
        "astro",
        "astro-markdown",
        "blade",
        "clojure",
        "django-html",
        "htmldjango",
        "edge",
        "eelixir",
        "elixir",
        "ejs",
        "erb",
        "eruby",
        "gohtml",
        "gohtmltmpl",
        "haml",
        "handlebars",
        "hbs",
        "html",
        "htmlangular",
        "html-eex",
        "heex",
        "jade",
        "leaf",
        "liquid",
        "markdown",
        "mdx",
        "mustache",
        "njk",
        "nunjucks",
        "php",
        "razor",
        "slim",
        "twig",
        "css",
        "less",
        "postcss",
        "sass",
        "scss",
        "stylus",
        "sugarss",
        "javascript",
        "javascriptreact",
        "reason",
        "rescript",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "templ",
      },

      -- 3. Root Directory Logic (Simplified for user config)
      -- This finds the root based on tailwind config files or package.json
      root_dir = util.root_pattern(
        "tailwind.config.js",
        "tailwind.config.cjs",
        "tailwind.config.mjs",
        "tailwind.config.ts",
        "postcss.config.js",
        "postcss.config.cjs",
        "postcss.config.mjs",
        "postcss.config.ts",
        "package.json"
      ),

      -- 4. Settings (Linting and validation)
      settings = {
        tailwindcss = {
          validate = true,
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidScreen = "error",
            invalidVariant = "error",
            invalidConfigPath = "error",
            invalidTailwindDirective = "error",
            recommendedVariantOrder = "warning",
          },
          classAttributes = {
            "class",
            "className",
            "class:list",
            "classList",
            "ngClass",
          },
          includeLanguages = {
            eelixir = "html-eex",
            eruby = "erb",
            templ = "html",
            htmlangular = "html",
            -- Ensure Razor is treated as HTML for class completion if needed
            razor = "html",
          },
        },
      },

      -- 5. On Attach / Capabilities (Optional but recommended)
      -- If you have common on_attach logic, add it here, e.g.:
      -- on_attach = function(client, bufnr) ... end
    })
  end,
}
