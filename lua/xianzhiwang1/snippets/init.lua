local success, ls = pcall(require, "luasnip")
if not success then return print("WARNING: luasnip not loaded.") end

ls.config.setup({ enable_autosnippets = true })
local lualoader = require("luasnip.loaders.from_lua")
lualoader.load({
  paths = {
    "~/.config/nvim/lua/user/snippets/tex",
    "~/.config/nvim/lua/user/snippets/all",
    "~/.config/nvim/lua/user/snippets/md",
  },
})
