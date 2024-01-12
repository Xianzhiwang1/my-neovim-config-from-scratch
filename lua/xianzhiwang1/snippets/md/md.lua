local ls = require "luasnip"
local utils = require("xianzhiwang1.snippets.tex.utils")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix

local default_opts = { show_condition = function() return false end }

local snippets = {
  s({ trig = "bol" }, { t("Bolshevik") }, default_opts),
  s({ trig = "mens" }, { t("Menshevik") }, default_opts),
  s({ trig = "alx" }, { t("Alexievich") }, default_opts),
  s({ trig = "nik" }, { t("Khrushchev") }, default_opts),
  s({ trig = "leo" }, { t("Brezhnev") }, default_opts),
  s({ trig = "mik" }, { t("Gorbachev") }, default_opts),
  s({ trig = "def" }, { t("**"), i(1), t("**: "), i(0)}, default_opts),
}

ls.add_snippets("markdown", snippets, { type = "snippets" })
