-- ~/.config/nvim/lua/code_snippet_organizer/db.lua

local sqlite = require("sqlite")
local M = {}

local db_path = vim.fn.stdpath("data") .. "/snippet_store.db"
M.db = sqlite.new(db_path)

function M.init()
  M.db:exec([[
    CREATE TABLE IF NOT EXISTS snippets (
      id INTEGER PRIMARY KEY,
      content TEXT,
      tags TEXT,
      language TEXT,
      created_at TEXT
    );
  ]])
end

function M.insert_snippet(content, tags, language)
  M.db:insert("snippets", {
    content = content,
    tags = tags,
    language = language,
    created_at = os.date("%Y-%m-%d %H:%M:%S")
  })
end

function M.get_snippets_by_tag(tag)
  return M.db:select("snippets"):where_like("tags", "%" .. tag .. "%"):exec()
end

function M.get_snippets_by_language(lang)
  return M.db:select("snippets"):where({ language = lang }):exec()
end

function M.get_all_snippets()
  return M.db:select("snippets"):exec()
end

return M
