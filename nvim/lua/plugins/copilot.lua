return {
  {
    "github/copilot.vim", -- Official Copilot plugin
    cmd = "Copilot", -- Lazy-load on command
    event = "InsertEnter", -- or load on insert mode
    config = function()
      -- Optional: enable Copilot automatically
      vim.cmd("Copilot enable")
    end,
  },
}
