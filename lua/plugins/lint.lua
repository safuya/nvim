---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = "User AstroFile",
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      go = { "golangcilint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim_lint", { clear = true }),
      callback = function() lint.try_lint() end,
    })
  end,
}
