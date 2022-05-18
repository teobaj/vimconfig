vim.cmd "hi clear"
if vim.fn.exists "syntax_on" then
  vim.cmd "syntax reset"
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "default_theme"

local user_plugin_opts = require("core.utils").user_plugin_opts

local util = require "default_theme.util"

local modules = {
  "base",
  "treesitter",
  "lsp",
  "others",
}

local highlights = {}

C = require "default_theme.colors"

for _, module in ipairs(modules) do
  highlights = vim.tbl_deep_extend("force", highlights, require("default_theme." .. module))
end

for group, colors in pairs(user_plugin_opts("default_theme.highlights", highlights)) do
  util.highlight(group, colors)
end

vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE")
vim.cmd("hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE")
vim.cmd("hi CursorLineNr cterm=NONE ctermbg=NONE ctermbg=NONE")
vim.cmd("hi clear LineNr")
vim.cmd("hi clear SignColumn")
vim.cmd("hi clear StatusLine")
