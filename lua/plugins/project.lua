return {
  "akorzunin/project.nvim",
  dir = (function()
    if DEBUG and IS_WINDOWS then
      return "C:\\Users\\akorz\\Documents\\project.nvim"
    elseif DEBUG and not IS_WINDOWS then
      return "~/Documents/project.nvim"
    end
    return nil
  end)(),
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup {
      show_files = "filtered_builtin",
      list = {
        "oldfiles",
        "find_files",
        "live_grep",
      },
    }
    require("nvim-tree").setup {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      git = {
        ignore = false,
      },
    }
  end,
}
