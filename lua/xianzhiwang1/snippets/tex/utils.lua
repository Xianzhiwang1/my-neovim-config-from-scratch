local ls = require "luasnip"
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

local trailing = function(nodes)
  table.insert(nodes, 1, f(
                   function(_, parent)
        return parent.snippet.env.POSTFIX_MATCH
      end))
  return nodes
end

local in_mathzone = function()
  return vim.api.nvim_eval("vimtex#syntax#in_mathzone()") == 1
end

local notin_mathzone = function() return not in_mathzone() end

local create_env_snip = function(name)
  return {
    t({"\\begin{" .. name .. "}", "\t"}),
    i(0),
    t({"", "\\end{" .. name .. "}", ""}),
  }
end

local greek_letters = {
  a = "alpha",
  b = "beta",
  c = "chi",
  d = "delta",
  e = "epsilon",
  f = "phi",
  g = "gamma",
  h = "eta",
  i = "iota",
  j = "varphi",
  k = "kappa",
  l = "lambda",
  m = "mu",
  n = "nu",
  o = "omicron",
  p = "pi",
  q = "theta",
  r = "rho",
  s = "sigma",
  t = "tau",
  u = "upsilon",
  v = "ell",
  w = "omega",
  x = "xi",
  y = "psi",
  z = "zeta",
}

return {
  in_mathzone = in_mathzone,
  notin_mathzone = notin_mathzone,
  trailing = trailing,
  GREEK_LETTERS = greek_letters,
  create_env_snip = create_env_snip,
}

