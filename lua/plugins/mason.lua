-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, {
        "bash-language-server",
        "cmake-language-server",
        "delve",
        "dockerfile-language-server",
        "eslint-lsp",
        "flake8",
        "gh-actions-language-server",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "gopls",
        "helm-ls",
        "jedi-language-server",
        "json-lsp",
        "lua-language-server",
        "markdown-oxide",
        "prettierd",
        "stylua",
        "terraform-ls",
        "tree-sitter-cli",
        "vtsls",
        "yaml-language-server",
      })
    end,
  },
}
