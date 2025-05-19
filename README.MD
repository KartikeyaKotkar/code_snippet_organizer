📘 Code Snippet Organizer

A lightweight Neovim plugin written in Lua for saving, organizing, and searching code snippets using SQLite.
✨ Features

    🧠 Save code snippets with language and tags.

    🔍 Search snippets by tag or language.

    🧭 Optional Telescope.nvim integration for fuzzy searching.

    🗂️ Stores data in a local SQLite database (no internet required).

📦 Requirements

    Neovim 0.7+ with Lua support

    nvim-lua/plenary.nvim

    kkharji/sqlite.lua

    (Optional) nvim-telescope/telescope.nvim

🔧 Installation

Using lazy.nvim:

      {
         "yourusername/code-snippet-organizer",
         dependencies = {
         "nvim-lua/plenary.nvim",
         "kkharji/sqlite.lua",
         "nvim-telescope/telescope.nvim", -- optional
         },
         config = function()
         require("code_snippet_organizer").setup()
         end,
      }

Manually (if placing in your config):

      -- ~/.config/nvim/lua/code_snippet_organizer/init.lua    
         require("code_snippet_organizer").setup()

🚀 Usage

Command	Action

      :SaveSnippet	Prompt to enter a snippet, tags, and language.

      :FindSnippetByTag	Search snippets using a tag.

      :FindSnippetByLang	Search snippets by programming language.

🔍 Telescope Integration (Optional)

To use the fuzzy finder interface:

      require("code_snippet_organizer.telescope_picker").snippet_picker()

Map it to a key:

      vim.keymap.set("n", "<leader>cs", function()
      require("code_snippet_organizer.telescope_picker").snippet_picker()
      end, { desc = "Find Snippets" })

🗄️ Snippet Storage

Snippets are stored in a SQLite database at:

      ~/.local/share/nvim/snippet_store.db

Each snippet stores:

    content (code/text)

    tags (comma-separated)

    language (e.g., Lua, Python)

    created_at (timestamp)

🛠 Example

\:SaveSnippet
-- content: print("Hello, world!")
-- tags: hello, example
-- language: lua
