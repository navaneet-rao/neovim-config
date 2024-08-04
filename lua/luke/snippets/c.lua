local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda

-- Advanced C snippets
ls.add_snippets("c", {
	-- Macro with variable arguments
	s(
		"macrova",
		fmt("#define {}({}) {}\n", {
			i(1, "MACRO_NAME"),
			i(2, "args..."),
			i(3, "body"),
		})
	),

	-- File I/O with error checking
	s(
		"fileio",
		fmt(
			[[
        FILE *file = fopen({}, "r");
        if (file == NULL) {{
          perror("Error opening file");
          exit(EXIT_FAILURE);
        }}

        {} // file operations

        fclose(file);
      ]],
			{
				i(1, '"filename.txt"'),
				i(2, "/* file operations */"),
			}
		)
	),
})
