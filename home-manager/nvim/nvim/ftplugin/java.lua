local handle = io.popen("nix-store -q --outputs $(nix-instantiate '<nixpkgs>' -A jdt-language-server)")
local jdtls_path = handle:read("*a"):gsub("%s+", "") -- Strip whitespace (newlines)
handle:close()

-- Get the exact version of org.eclipse.equinox.launcher in the plugins folder
local equinox_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")

-- Set workspace dynamically based on the current project
local workspace_dir = "/home/zvasoup/.workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
	cmd = { jdtls_path .. "/bin/jdtls", "-noverify", "--add-root" },
	-- cmd = { "${pkgs.jdt-language-server}/bin/jdt-language-server", "-noverify" },
	-- cmd = { "jdtls", "-noverify", "-Declipse.product=org.eclipse.jdt.ls.core.product", "--add-root" },
	-- cmd = {
	-- 	"java",
	--
	-- 	"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	-- 	"-Dosgi.bundles.defaultStartLevel=4",
	-- 	"-Declipse.product=org.eclipse.jdt.ls.core.product",
	-- 	"-Dlog.protocol=true",
	-- 	"-Dlog.level=ALL",
	-- 	"-Xmx1g",
	-- 	"--add-modules=ALL-SYSTEM",
	-- 	"--add-opens",
	-- 	"java.base/java.util=ALL-UNNAMED",
	-- 	"--add-opens",
	-- 	"java.base/java.lang=ALL-UNNAMED",
	-- 	"jar",
	-- 	equinox_jar, -- Dynamically resolved launcher jar
	-- 	"-configuration",
	-- 	jdtls_path .. "/config_linux", -- Dynamically resolved config path for Linux
	-- 	"-data",
	-- 	workspace_dir, -- Dynamic workspace per project
	-- },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {},
	},
}
require("jdtls").start_or_attach(config)
