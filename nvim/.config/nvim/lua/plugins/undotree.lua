return {
  "mbbill/undotree",
  enabled = true,
  cmd = "UndotreeToggle",
  keys = {
    { "<F5>", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
    { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
  },
}
