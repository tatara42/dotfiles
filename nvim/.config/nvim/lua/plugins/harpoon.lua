return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- "nvim-telescope/telescope-ui-select.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon: Add file",
    },
    {
      "<Tab>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon: Toggle menu",
    },
    {
      "<leader>1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon: Select 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon: Select 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon: Select 3",
    },
    {
      "<leader>4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon: Select 4",
    },
    {
      "<leader>5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon: Select 5",
    },
    {
      "<leader>6",
      function()
        require("harpoon"):list():select(6)
      end,
      desc = "Harpoon: Select 6",
    },
    {
      "<leader>7",
      function()
        require("harpoon"):list():select(7)
      end,
      desc = "Harpoon: Select 7",
    },
    {
      "<C-S-P>",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon: Previous file",
    },
    {
      "<C-S-N>",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon: Next file",
    },
  },
}
