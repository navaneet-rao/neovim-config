local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("lua", {

	s("func", { t("function "), i(1, "name"), t("()"), t({ "", "end" }) }),
	s("func1", fmt("function {}() end", { i(0) })),

	s(
		"cfc",
		fmt(
			[[
            config = function()
                require({}).setup({})
                {}
            end
        ]],
			{ i(1), i(2), i(0) }
		)
	),
})
