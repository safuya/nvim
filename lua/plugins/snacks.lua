---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
        enabled = false,
        scope = { enabled = false },
      })
      opts.scope = vim.tbl_deep_extend("force", opts.scope or {}, {
        enabled = false,
      })
      return opts
    end,
  },
}
