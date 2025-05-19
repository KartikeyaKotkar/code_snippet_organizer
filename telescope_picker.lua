-- ~/.config/nvim/lua/code_snippet_organizer/telescope_picker.lua

local db = require("code_snippet_organizer.db")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local M = {}

function M.snippet_picker()
  local snippets = db.get_all_snippets()

  pickers.new({}, {
    prompt_title = "Snippets",
    finder = finders.new_table({
      results = snippets,
      entry_maker = function(entry)
        return {
          value = entry,
          display = "[" .. entry.language .. "] " .. entry.content,
          ordinal = entry.content .. " " .. entry.tags,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(_, map)
      map("i", "<CR>", function()
        local selection = action_state.get_selected_entry()
        actions.close()
        vim.fn.setreg("+", selection.value.content)
        print("📋 Snippet copied to clipboard!")
      end)
      return true
    end,
  }):find()
end

return M
