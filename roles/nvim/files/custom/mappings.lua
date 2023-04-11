---@type MappingsConfig
local M = {}

M.general = {
  n = {
    ["ff"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "   lsp formatting",
    },
    ["<leader>ge"] = {
      function()
        vim.diagnostic.open_float({})
      end,
      "   lsp diagnostic",
    },
  },
}

-- more keybinds!

return M
