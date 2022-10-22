local auto_ok, npairs = pcall(require, "nvim-autopairs")
local cmp_ok, cmp = pcall(require, "cmp")
if not (auto_ok and cmp_ok) then
    return
end

npairs.setup({
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "vim" },
    ts_config = {
        lua = { "string", "template_string" },
        javascript = { "string", "template_string" },
    },
    fast_wrap = {},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
