-- Setup nvim-cmp.
local compare = require("cmp.config.compare")
local cmp = require "cmp"
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered({ side_padding = 0 }),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        -- Find a better way to scroll docs.
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        -- TODO: Better jumping? I dont really use jumping
        -- Expand snippets with spacebar if cmp menu is visible
        ["<Space>"] = cmp.mapping(function(fallback)
            if luasnip.expandable() and cmp.visible() and cmp.get_active_entry() then
                cmp.complete()
                luasnip.expand()
            elseif cmp.visible() and cmp.get_active_entry() then
                cmp.complete()
                cmp.close()
                fallback()
            else
                fallback()
            end
        end, { "i", "s" }),
        -- Supertab
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.jumpable() then
                luasnip.jump(1)
            elseif cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable() then
                luasnip.jump(-1)
            elseif cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Right>"] = cmp.mapping(function() luasnip.jump(1) end, { "i", "s" }),
        ["<Left>"] = cmp.mapping(function() luasnip.jump(-1) end, { "i", "s" }),
        ["<Return>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Up>"] = cmp.mapping(function() cmp.select_prev_item() end, { "i", "s" }),
        ["<Down>"] = cmp.mapping(function() cmp.select_next_item() end, { "i", "s" }),
    },
    sources = { { name = "luasnip" }, { name = "nvim_lsp" }, { name = "path" }  },
    formatting = {
        format = function(entry, vim_item)
            local clients = vim.lsp.get_active_clients()
            if clients[1] and clients[1].messages and clients[1].messages.name ==
                "texlab" and entry and entry.source.name == "nvim_lsp" then
                local s = tostring(entry:get_documentation()[2])
                local p = string.find(s, ",")
                if p then vim_item.menu = s:sub(1, p - 1) end
                entry.get_documentation = function() return { "", s } end
            end
            vim_item.dup = { nvim_lsp = 1 }
            return vim_item
        end,
    },
    sorting = {
        comparators = {
            compare.exact,
            compare.score,
            compare.length,
            compare.recently_used,
            function(a, b)
                local doc_a = tostring(a:get_documentation()[2]) or ""
                local doc_b = tostring(b:get_documentation()[2]) or ""
                local uda = doc_a:find("user%-defined") or 0
                local udb = doc_b:find("user%-defined") or 0
                return uda < udb
            end,
        },
    },
    matching = { disallow_fuzzy_matching = false },
})

