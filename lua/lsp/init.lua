local lsp_setup = require("lsp.lsp_setup")
local register_lsp = require("lsp.register_lsp")

local lsp_servers = {
    -- "cssls",
    -- "cssmodules_ls",
    -- "docker_compose_language_service",
    -- "dockerls",
    -- "eslint",
    -- "golangci_lint_ls",
    -- "gopls",
    -- "html",
    -- "jqls",
    -- "jsonls",
    "lua_language_server",
    "pyright",
    "ruff",
    -- "rust_analyzer",
    -- "solc",
    -- "solidity",
    -- "sqlls",
    -- "taplo",
    -- "texlab",
    -- "tsserver",
    -- "volar",
    -- "yamlls",
}

lsp_setup()
for _, server_name in ipairs(lsp_servers) do
    local server_module = require("lsp.servers." .. server_name)
    register_lsp(server_module)
end

