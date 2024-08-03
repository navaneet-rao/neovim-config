local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

return {
	s("func", { t("function "), i(1, "name"), t("()"), t({ "", "end" }) }),
	s("func1", fmt("function {}() end", { i(0) })),
}
