local server = require "mason-lspconfig.mappings.server"

local M = {}

function M.get_mason_map()
  return {
    package_to_lspconfig = server.package_to_lspconfig,
    lspconfig_to_package = server.lspconfig_to_package,
  }
end

return M
