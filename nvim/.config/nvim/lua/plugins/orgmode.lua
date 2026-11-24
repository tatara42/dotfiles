return {
  {
    "nvim-orgmode/orgmode",
    enabled = false,
    event = "VeryLazy",
    ft = { "org" },
    dependencies = {
      {
        "akinsho/org-bullets.nvim",
        opts = {
          symbols = {
            list = "•",
            headlines = { "◉", "○", "✸", "✿", "◇" },
            checkboxes = {
              half = { "", "@org.checkbox.halfchecked" },
              done = { "✓", "@org.keyword.done" },
              todo = { " ", "@org.keyword.todo" },
            },
          },
        },
      },
    },
    keys = {
      { "<leader>oa", "<cmd>lua require('orgmode').action('agenda.prompt')<cr>", desc = "Org: Agenda" },
      { "<leader>oc", "<cmd>lua require('orgmode').action('capture.prompt')<cr>", desc = "Org: Capture" },
      { "<leader>oj", "<cmd>edit ~/org/journal.org<cr>", desc = "Org: Open Journal" },
      { "<leader>ot", "<cmd>edit ~/org/todos.org<cr>", desc = "Org: Open Todos" },
    },
    config = function()
      require("orgmode").setup({
        org_agenda_files = { "~/org/**/*" },
        org_default_notes_file = "~/org/notes.org",
        org_todo_keywords = { "TODO(t)", "PROGRESS(p)", "WAITING(w)", "|", "DONE(d)", "CANCELLED(c)" },
        org_hide_emphasis_markers = true,

        -- Doom Emacs style Capture Templates
        org_capture_templates = {
          t = {
            description = "Task / Todo",
            template = "* TODO %?\n  SCHEDULED: %t\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n",
            target = "~/org/todos.org",
          },
          j = {
            description = "Daily Journal",
            template = "\n* %<%Y-%m-%d %A>\n** %U - %?\n",
            target = "~/org/journal.org",
          },
          n = {
            description = "General Note",
            template = "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n\n  %i",
            target = "~/org/notes.org",
          },
        },
      })
    end,
  },
}
