local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

local servers = {
}

for _, lsp in ipairs(servers) do
    config[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
