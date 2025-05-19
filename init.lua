-- ~/.config/nvim/lua/code_snippet_organizer/init.lua

local M = {}

function M.setup()
  require("code_snippet_organizer.db").init()
  require("code_snippet_organizer.commands").setup()

end

return M
