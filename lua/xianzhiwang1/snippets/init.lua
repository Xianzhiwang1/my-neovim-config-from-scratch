local success, ls = pcall(require, "luasnip")
if not success then return print("WARNING: luasnip not loaded.") end

-- ls.config.setup({ enable_autosnippets = true })
ls.config.set_config({
    history = true,
    enable_autosnippets = true,
})

local lualoader = require("luasnip.loaders.from_lua")
lualoader.load({
  paths = {
    "~/.config/nvim/lua/xianzhiwang1/snippets/tex",
    "~/.config/nvim/lua/xianzhiwang1/snippets/all",
    "~/.config/nvim/lua/xianzhiwang1/snippets/md",
  },
})
