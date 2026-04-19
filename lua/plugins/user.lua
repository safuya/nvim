---@type LazySpec
return {
  {
    "mrjosh/helm-ls",
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function() require("nvim-surround").setup {} end,
  },
  { "max397574/better-escape.nvim", enabled = false },
}
