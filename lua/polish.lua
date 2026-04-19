-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Reduce LSP log noise: terraform-ls (and other servers) write verbose info to stderr,
-- which Neovim's transport layer logs as [ERROR] regardless of severity.
-- Setting ERROR level still captures genuine errors from all LSPs.
vim.schedule(function()
  if type(vim.lsp) == "table" and vim.lsp.log then vim.lsp.log.set_level("ERROR") end
end)

-- Some plugins start markdown treesitter directly for popup/help-style buffers.
-- Neovim 0.12.1 currently crashes in the markdown highlighter path in this setup,
-- so skip TS start for markdown until the upstream issue is resolved.
do
  local treesitter_start = vim.treesitter.start
  vim.treesitter.start = function(bufnr, lang)
    if type(bufnr) == "string" and lang == nil then
      lang = bufnr
      bufnr = 0
    end
    bufnr = bufnr or 0
    local target_buf = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
    local resolved_lang = lang or vim.bo[target_buf].filetype
    if resolved_lang == "markdown" or resolved_lang == "markdown_inline" then return false end
    return treesitter_start(bufnr, lang)
  end
end
