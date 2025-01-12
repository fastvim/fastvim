local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

ls.add_snippets("python", {
  s("def", {
    t("def "), i(1, "function_name"), t("("), i(2, "args"), t("):"),
    t({"", "    "}), i(3, "pass")
  }),
   s("doc", {
    t('"""'), i(1, "Description of the function."), t({"", "", "Args:"}),
    t("param1 (type): "), i(2, "Description of param1."), t({"", "param2 (type): "}), i(3, "Description of param2."),
    t({"", "", "Returns:"}), t("return_type: "), i(4, "Description of the return value."),
    t({"", '"""'})
  }),
  s("for", {
    t("for "), i(1, "item"), t(" in "), i(2, "list"), t(":"),
    t({"", "    "}), i(3, "pass")
  })
})

ls.add_snippets("go", {
  s("doc", {
    t("// "), i(1, "Description of the function."), t({"", "", "Args:"}),
    t("param1 (type): "), i(2, "Description of param1."), t({"", "param2 (type): "}), i(3, "Description of param2."),
    t({"", "", "Returns:"}), t("return_type: "), i(4, "Description of the return value."),
    t({"", "func "}), i(5, "function_name"), t({"(", ""}), i(6, "param1"), t(", "), i(7, "param2"), t({")", "{"}),
    t({"", "    "}), i(8, "return_value"), t({"", "}"}),
  })
})

ls.add_snippets("javascript", {
  s("doc", {
    t("/**"), t({"", " * "}), i(1, "Description of the function."), t({"", " *"}), t({"", " * @param {type} param1 Description of param1."}),
    t({"", " * @param {type} param2 Description of param2."}), t({"", " *"}), t({"", " * @returns {return_type} Description of the return value."}),
    t({"", " */"}), t({"", "function "}), i(2, "function_name"), t({"("}), i(3, "param1"), t(", "), i(4, "param2"), t({")", "{"}),
    t({"", "    "}), i(5, "return_value"), t({"", "}"})
  })
})

ls.add_snippets("cpp", {
  s("doc", {
    t("/**"), t({"", " * "}), i(1, "Description of the function."), t({"", " *"}), t({"", " * @param param1 Description of param1."}),
    t({"", " * @param param2 Description of param2."}), t({"", " *"}), t({"", " * @return Description of the return value."}),
    t({"", " */"}), t({"", "return_type "}), i(2, "function_name"), t({"("}), i(3, "param1"), t(", "), i(4, "param2"), t({")", "{"}),
    t({"", "    "}), i(5, "return_value"), t({"", "}"})
  })
})

-- html standard structure 

ls.add_snippets("html", {
  s("dhmt", {
    t({
      "<!DOCTYPE html>",
      "<html lang=\"en\">",
      "<head>",
      "    <meta charset=\"UTF-8\">",
      "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">",
      "    <title>"
    }),
    i(1, "Document"),
    t({
      "</title>",
      "</head>",
      "<body>",
      "    "
    }),
    i(2),
    t({
      "",
      "</body>",
      "</html>"
    }),
  })
})
