-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Reduce LSP log noise: terraform-ls (and other servers) write verbose info to stderr,
-- which Neovim's transport layer logs as [ERROR] regardless of severity.
-- Setting ERROR level still captures genuine errors from all LSPs.
vim.schedule(function()
  if type(vim.lsp) == "table" and vim.lsp.log then vim.lsp.log.set_level("ERROR") end
end)
