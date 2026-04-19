---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = "User AstroFile",
  cmd = "ConformInfo",
  keys = {
    {
      "<Leader>lf",
      function() require("conform").format { async = true, lsp_format = "fallback" } end,
      desc = "Format buffer",
    },
  },
  opts = {
    format_on_save = function(bufnr)
      if vim.bo[bufnr].buftype ~= "" then return nil end
      return {
        timeout_ms = 1000,
        lsp_format = "fallback",
      }
    end,
    formatters_by_ft = {
      go = { "goimports", "gofumpt" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      lua = { "stylua" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      yaml = { "prettierd" },
    },
  },
}
