local lombok_path = "/home/sanae/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar"
local jdtls_launcher = vim.fn.glob("/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
local jdtls = require("jdtls")
local mason_path = vim.fn.stdpath("data") .. "/mason"
local java_debug_path = mason_path .. "/packages/java-debug-adapter"
local java_test_path = mason_path .. "/packages/java-test"

local root_dir = jdtls.setup.find_root({ "mvnw", "gradlew", ".git", "pom.xml" })
local project_name = vim.fn.fnamemodify(root_dir, ":t")
local workspace_dir = root_dir .. "/.jdtls"
bundles = {}
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(java_debug_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"), "\n")
)

vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

local M = {
	cmd = {
		"java",
		"-javaagent:" .. lombok_path,
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xms1g",
		"-jar",
		jdtls_launcher,
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-configuration",
		"/usr/share/java/jdtls/config_linux",
		"-data",
		"/home/sanae/.local/share/jdtls/workspace" .. workspace_dir,
	},
	root_dir = root_dir,
	settings = {
		java = {
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			configuration = {
				updateBuildConfiguration = "interactive",
			},
		},
	},

	init_options = {
		bundles = bundles,
	},
}
jdtls.start_or_attach(M)
jdtls.setup_dap({ hotcodereplace = "auto" })
