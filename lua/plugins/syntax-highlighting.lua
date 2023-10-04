local Module = {}

Module.plugin_spec = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        local config = {
            sync_install = false,
            auto_install = true,
            ensure_installed = {
                "bash",
                "css",
                "csv",
                "diff",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "html",
                "ini",
                "javascript",
                "json",
                "json5",
                "kotlin",
                "latex",
                "lua",
                "make",
                "markdown",
                "markdown_inline",
                "passwd",
                "python",
                "rust",
                "scss",
                "sql",
                "ssh_config",
                "toml",
                "typescript",
                "tsx",
                "vim",
                "xml",
                "yaml",
            },
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = {},
            },
            incremental_selection = {
                enable = false,
            },
            indent = {
                enable = true,
                disable = {},
            }
        }

        configs.setup(config)
    end
}

return Module
