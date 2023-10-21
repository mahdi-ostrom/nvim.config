local Module = {}

local keymap = vim.keymap.set
local telescope_builtin = require("telescope.builtin")

Module.set_lsp_highlight_document_if_client_supports = function (client)
  if client.server_capabilities.documentHighlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

Module.set_lsp_keymaps = function (buffer_number)
    local opts = { noremap = true, silent = true, buffer = buffer_number }

    opts.desc = "Show LSP references"
    keymap("n", "gR", telescope_builtin.lsp_references, opts) -- or  vim.lsp.buf.references

    opts.desc = "Go to declaration"
    keymap("n", "gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    keymap("n", "gd", telescope_builtin.lsp_definitions, opts) -- or vim.lsp.buf.definition

    opts.desc = "Show LSP implementations"
    keymap("n", "gi", telescope_builtin.lsp_implementations, opts) -- or vim.lsp.buf.implementation

    opts.desc = "Show LSP type definitions"
    keymap("n", "gt", telescope_builtin.lsp_type_definitions, opts)

    opts.desc = "Smart rename"
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Show signature's help"
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)

    opts.desc = "See available code actions"
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Go to previous diagnostic"
    keymap("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)

    opts.desc = "Show line diagnostics"
    keymap("n", "gl", vim.diagnostic.open_float, opts)

    opts.desc = "Go to next diagnostic"
    keymap("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)

    opts.desc = "Show buffer diagnostics"
    keymap("n", "<leader>D", function() telescope_builtin.diagnostics({bufnr=0}) end, opts)

    opts.desc = nil
    keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

Module.binary_exists = function (binary)
    return vim.fn.executable(binary) == 1
end

return Module
