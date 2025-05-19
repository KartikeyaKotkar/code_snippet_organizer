-- ~/.config/nvim/lua/code_snippet_organizer/commands.lua

local db = require("code_snippet_organizer.db")

local M = {}

function M.setup()
  vim.api.nvim_create_user_command("SaveSnippet", function()
    local content = vim.fn.input("Snippet content: ")
    local tags = vim.fn.input("Tags (comma-separated): ")
    local language = vim.fn.input("Language: ")
    db.insert_snippet(content, tags, language)
    print("✅ Snippet saved!")
  end, {})

  vim.api.nvim_create_user_command("FindSnippetByTag", function()
    local tag = vim.fn.input("Search tag: ")
    local results = db.get_snippets_by_tag(tag)
    for _, snippet in ipairs(results) do
      print(string.format("[%s] %s", snippet.language, snippet.content))
    end
  end, {})

  vim.api.nvim_create_user_command("FindSnippetByLang", function()
    local lang = vim.fn.input("Search language: ")
    local results = db.get_snippets_by_language(lang)
    for _, snippet in ipairs(results) do
      print(string.format("[%s] %s", snippet.tags, snippet.content))
    end
  end, {})
end

return M
