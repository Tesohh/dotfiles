function load_custom_snippets()
    local ls = require("luasnip") -- Load LuaSnip
    local s = ls.snippet       -- Define a snippet
    local t = ls.text_node     -- Text for the snippet
    local i = ls.insert_node   -- Insert node (placeholder)

    -- ls.add_snippets("c", {
    --     s("smalloc", {
    --         i(1, "void* obj"),
    --         t(" = malloc()")
    --     }),
    -- })
end
