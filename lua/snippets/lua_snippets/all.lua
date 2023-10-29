local h = require("snippets.lua_snippets.helpers")
h.ls.add_snippets("all", {

    h.s("ter", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        h.i(1, "cond"), h.t(" ? "), h.i(2, "then"), h.t(" : "), h.i(3, "else")
    })
})
