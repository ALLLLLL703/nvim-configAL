local lombok_path = "/home/sanae/.m2/repository/org/projectlombok/lombok/1.18.34/lombok-1.18.34.jar"
local jdtls_launcher = vim.fn.glob("/usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")
return {

	cmd = {
		"java",
		"-javaagent:" .. lombok_path,
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Xms1g",
		"-jar",
		jdtls_launcher,
		"-configuration",
		"/usr/share/java/jdtls/config_linux",
		"-data",
		vim.cmd("pwd"),
	},
	root_dir = { ".git", "mvnw", "gradlew" },

	filetypes = { "java", "class" },
}
