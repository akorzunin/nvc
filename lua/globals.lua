IS_WINDOWS = vim.loop.os_uname().sysname == "Windows_NT"

P = function(t)
  print(vim.inspect(t))
  return t
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(module_name)
  RELOAD(module_name)
  return require(module_name)
end
