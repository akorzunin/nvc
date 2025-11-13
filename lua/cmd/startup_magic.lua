local magic = {
  [":/"] = function()
    -- handeled by persistence.nvim
  end,

  [":w"] = function()
    vim.cmd.Telescope "live_grep"
  end,

  [":f"] = function()
    vim.cmd.Telescope "find_files"
  end,
}

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if vim.g.session_loaded then
      return
    end
    local args = vim.fn.argv()
    if #args ~= 1 then
      return
    end -- user typed more than one thing
    local key = args[1]
    if not magic[key] then
      return
    end -- not our magic token
    vim.cmd.bwipeout { bang = true }
    magic[key]()
  end,
  nested = true,
})
