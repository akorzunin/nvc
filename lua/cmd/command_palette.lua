local M = {}

local function selected_case(change)
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local sr, sc = start_pos[2], start_pos[3]
  local er, ec = end_pos[2], end_pos[3]

  if sr == 0 or er == 0 then
    vim.notify("Select text first", vim.log.levels.WARN)
    return
  end

  if sr > er or (sr == er and sc > ec) then
    sr, er = er, sr
    sc, ec = ec, sc
  end

  local lines = vim.api.nvim_buf_get_lines(0, sr - 1, er, false)
  if #lines == 0 then
    return
  end

  if sr == er then
    local line = lines[1]
    lines[1] = line:sub(1, sc - 1)
      .. change(line:sub(sc, ec))
      .. line:sub(ec + 1)
  else
    lines[1] = lines[1]:sub(1, sc - 1) .. change(lines[1]:sub(sc))
    for i = 2, #lines - 1 do
      lines[i] = change(lines[i])
    end
    lines[#lines] = change(lines[#lines]:sub(1, ec))
      .. lines[#lines]:sub(ec + 1)
  end

  vim.api.nvim_buf_set_lines(0, sr - 1, er, false, lines)
end

local function replace(range)
  vim.ui.input({ prompt = "Find: " }, function(search)
    if not search or search == "" then
      return
    end

    vim.ui.input({ prompt = "Replace with: " }, function(replacement)
      if replacement == nil then
        return
      end

      vim.cmd(
        string.format(
          "%ss/%s/%s/g",
          range,
          vim.fn.escape(search, [[\/]]),
          vim.fn.escape(replacement, [[\/&]])
        )
      )
    end)
  end)
end

local commands = {
  {
    name = "Buffer: next",
    run = function()
      vim.cmd.bnext()
    end,
  },
  {
    name = "Selection: uppercase",
    run = function()
      selected_case(vim.fn.toupper)
    end,
  },
  {
    name = "Selection: lowercase",
    run = function()
      selected_case(vim.fn.tolower)
    end,
  },
  {
    name = "Replace in file",
    run = function()
      replace "%"
    end,
  },
  {
    name = "Replace in selection",
    run = function()
      replace "'<,'>"
    end,
  },
  {
    name = "Kitty: open here",
    run = function()
      vim.cmd.KittyHere()
    end,
  },
  {
    name = "Format current file",
    run = function()
      require("conform").format { async = true, lsp_fallback = true }
    end,
  },
}

function M.open()
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local conf = require("telescope.config").values
  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"

  pickers
    .new({}, {
      prompt_title = "Command Palette",
      finder = finders.new_table {
        results = commands,
        entry_maker = function(command)
          return {
            value = command,
            display = command.name,
            ordinal = command.name,
          }
        end,
      },
      sorter = conf.generic_sorter {},
      attach_mappings = function(bufnr)
        actions.select_default:replace(function()
          local command = action_state.get_selected_entry().value
          actions.close(bufnr)
          command.run()
        end)
        return true
      end,
    })
    :find()
end

return M
