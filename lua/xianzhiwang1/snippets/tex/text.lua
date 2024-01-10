local ls = require("luasnip")
local utils = require("user.snippets.tex.utils")
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

local default_opts = { condition = utils.notin_mathzone }

local auto_default_opts = {
    condition = utils.notin_mathzone,
    show_condition = function() return false end,
}
local text_types = { tbf = "textbf", tit = "textit", und = "underline" }

local autosnippets = {
    s("mk", { t("$"), i(1), t("$") }, auto_default_opts),
    s("bk", { t("{$"), i(1), t("$}") }, auto_default_opts),
    s("lbl", { t("\\label{"), i(1), t(":"), i(2), t("}") }, auto_default_opts),
    postfix({ trig = "([%w]+);;", regTrig = true }, {
        t("$"),
        f(function(_, parent) return parent.captures[1] end),
        t("$"),
    }, auto_default_opts),
}

local snippets = {
    s("ipa", { t("\\textipa{["), i(1), t("]}") }, default_opts),
    s("begin", {
        t("\\begin{"),
        i(1),
        t({ "}", }),
        i(2),
        t({ "", "\t" }),
        i(3),
        t({ "", "" }),
        t("\\end{"),
        f(function(args, snip)
            return args[1][1]
        end, { 1 }),
        t("}"),
    }, default_opts),
    s("def", {
        t("\\begin{definition}["),
        i(1),
        t({ "]", "" }),
        t("\t"),
        i(0),
        t({ "", "\\end{definition}", "" }),
    }, default_opts),
    s("eg", utils.create_env_snip("eg"), default_opts),
    s("eq", utils.create_env_snip("equation*"), default_opts),
    s("prf", utils.create_env_snip("proof"), default_opts),
    s("enum", utils.create_env_snip("enumerate"), default_opts),
    s("enums", utils.create_env_snip("enumerate*"), default_opts),
    s("aligns", utils.create_env_snip("align*"), default_opts),
    s("align", utils.create_env_snip("align"), default_opts),
    s("thm", utils.create_env_snip("theorem"), default_opts),
    s("lem", utils.create_env_snip("lemma"), default_opts),
    s("proper", utils.create_env_snip("property"), default_opts),
    s("prop", utils.create_env_snip("proposition"), default_opts),
    s("corr", utils.create_env_snip("corollary"), default_opts),
    s("it", { t("\\item") }, default_opts),
    s("figref", { t("Figure~\\ref{fig:"), i(1), t("}") }, default_opts),
    s("sfigref", { t("Figure~\\ref{sfig:"), i(1), t("}") }, default_opts),
    s("secref", { t("Section~\\ref{sec:"), i(1), t("}") }, default_opts),
    s("ssecref", { t("Section~\\ref{ssec:"), i(1), t("}") }, default_opts),
    s("sssecref", { t("Section~\\ref{sssec:"), i(1), t("}") }, default_opts),
    s("eqref", { t("Equation~\\ref{eq:"), i(1), t("}") }, default_opts),
    s("thmref", { t("Theorem~\\ref{thm:"), i(1), t("}") }, default_opts),
    s("lemref", { t("Lemma~\\ref{lem:"), i(1), t("}") }, default_opts),
    s("propref", { t("Proposition~\\ref{prop:"), i(1), t("}") }, default_opts),
    s("corrref", { t("Corollary~\\ref{corr:"), i(1), t("}") }, default_opts),
    s("corrref", { t("Corollary~\\ref{corr:"), i(1), t("}") }, default_opts),
    s("egref", { t("Example~\\ref{eg:"), i(1), t("}") }, default_opts),
}

for k, v in pairs(text_types) do
    local snip = postfix({ trig = "([%a%d]*)" .. k, regTrig = true }, {
        f(function(_, parent) return "\\" .. v .. "{" .. parent.captures[1] end),
        i(1),
        t("}"),
        i(0),
    }, default_opts)
    table.insert(snippets, snip)
end

ls.add_snippets("tex", snippets, { type = "snippets" })
ls.add_snippets("tex", autosnippets, { type = "autosnippets" })
