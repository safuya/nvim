# Neovim config

This config is built on [AstroNvim v6](https://docs.astronvim.com/) and should be read as a small set of opinionated customisations on top of the upstream defaults.

## Start with the AstroNvim docs

- Main docs: <https://docs.astronvim.com/>
- Configuration guide: <https://docs.astronvim.com/configuration/customizing_plugins/>
- AstroCommunity: <https://github.com/AstroNvim/astrocommunity>

If something is not documented in this repo, assume the AstroNvim default unless a local override says otherwise.

## What this config is optimised for

- Go development
- React / TypeScript development
- Platform engineering work across Kubernetes, GitOps, YAML, Helm, Terraform, Dockerfiles, and GitHub Actions
- Heavy use of `opencode` alongside Neovim
- Terminal-first workflow via WezTerm rather than Neovim terminal tooling

## Key tooling choices

### LSP

Configured language servers include:

- `gopls`
- `vtsls`
- `eslint`
- `jsonls`
- `yamlls`
- `dockerls`
- `terraformls`
- `helm_ls`
- `lua_ls`

## Formatting

Formatting is handled with `conform.nvim`, not `none-ls`.

Current formatter choices:

- Go: `goimports`, `gofumpt`
- JavaScript / TypeScript / TSX / JSON / YAML: `prettierd`
- Lua: `stylua`

## Linting

Linting is handled with `nvim-lint`.

Current linter choices:

- Go: `golangci-lint`
- Dockerfile: `hadolint`
- YAML: `yamllint`

`yamllint` was chosen because it is configurable and can be tuned to team preferences rather than forcing one rigid YAML style.

This config allows unindented block sequences under mappings to match team conventions, for example:

```yaml
something:
- item1
- item2
- item3
```

If you change the Neovim `yamllint` config, reload Neovim (or reload the plugin config) so the updated linter arguments are picked up.

## Git workflow

- `vim-fugitive` for core Git operations
- `diffview.nvim` for reviewing diffs and file history, especially useful for GitOps and infra changes

## Useful keymaps

These are the extra mappings worth remembering on top of the AstroNvim defaults.

### Formatting and linting

- `<Leader>lf` — format current buffer
- `<Leader>xl` — run configured linters for the current buffer

### Git and diff review

- `<Leader>gv` — open Diffview
- `<Leader>gV` — open file history in Diffview for the current file

### Validation helpers

- `<Leader>xt` — run `terraform validate`
- `<Leader>xh` — run `helm lint %`

For everything else, check AstroNvim defaults with `:which-key`.

## AI / completion

- AstroCommunity Copilot integration
- `opencode.nvim`

## Mason-managed tools

This config uses Mason to manage editor tooling where possible.

Examples of ensured tools include:

- `gopls`, `gofumpt`, `goimports`, `golangci-lint`, `delve`
- `vtsls`, `eslint-lsp`, `prettierd`
- `yaml-language-server`, `yamllint`
- `dockerfile-language-server`, `hadolint`
- `terraform-ls`, `helm-ls`

## Notes on workflow

- WezTerm is the preferred place for terminal and pane management
- Obsidian remains the main place for note editing; Neovim markdown support is useful but not the primary notes workflow
- This repo intentionally stays fairly close to AstroNvim defaults unless there is a clear workflow win
