local format = function()
  require("conform").format { async = true, lsp_fallback = true }
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    { "<leader>fm", format, mode = "", desc = "Format buffer" },
    { "<leader>ft", format, mode = "", desc = "Format buffer" },
    { "<F3>", format, mode = "", desc = "Format buffer" },
    {
      "<leader>afe",
      "<cmd> FormatEnable <CR>",
      desc = "enable auto formatting",
    },
    {
      "<leader>afd",
      "<cmd> FormatDisable <CR>",
      desc = "disable auto formatting",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      go = { "golines" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    -- Set up format-on-save
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes
      local ignore_filetypes = { "sql", "java" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match "/node_modules/" then
        return
      end
      return { timeout_ms = 1500, lsp_fallback = true }
    end,
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- autoformatting is disabled by default
    vim.g.disable_autoformat = true
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
      print "autoformatting is disabled"
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
      print "autoformatting is enabled"
    end, {
      desc = "Re-enable autoformat-on-save",
    })
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
