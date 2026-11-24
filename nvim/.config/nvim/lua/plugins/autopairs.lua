return {
  "windwp/nvim-autopairs",
  enabled = false,
  event = "InsertEnter",
  opts = {
    check_ts = true, -- enable treesitter
    ts_config = {
      lua = { "string" }, -- don't add pairs in lua string treesitter nodes
      javascript = { "template_string" },
    },
  },
  config = function(_, opts)
    local autopairs = require("nvim-autopairs")
    autopairs.setup(opts)

    -- Hook into nvim-cmp so confirming a function completion automatically adds parentheses: ()
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local ok, cmp = pcall(require, "cmp")
    if ok then
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  end,
}
