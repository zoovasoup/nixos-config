local handle = io.popen("nix-store -q --outputs $(nix-instantiate '<nixpkgs>' -A jdt-language-server)")
local jdtls_path = handle:read("*a"):gsub("%s+", "") -- Strip whitespace (newlines)
handle:close()

local config = {
	cmd = { jdtls_path .. "/bin/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
