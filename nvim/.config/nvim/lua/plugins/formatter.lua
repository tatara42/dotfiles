return {
  "stevearc/conform.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "golines" },
        php = { "pretty-php" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        cpp = { "clang-format" },
        c = { "clang-format" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
        cmake = { "cmakelang" },
        json = { "clang-format" },
        -- css = {"prettier" },
        -- html = { "prettier" },
        -- astro = { "prettier" },
      },
      format_on_save = false,

      -- format_after_save = {
      -- 	lsp_fallback = true,
      -- 	stop_after_first = true,
      -- },
      format_after_save = false,
    })
  end,
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      mode = { "n", "v" },
      desc = "Format file or range (in visual mode)",
    },
  },
}

