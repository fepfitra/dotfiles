fn some_function(data) {
    "echo test" + data;
};
fn arch_install(pkg) {
	return "bin=$(command -v yay || command -v paru); $bin -Q "+ pkg + " 2>/dev/null || $bin -S " + pkg +  " --noconfirm";
}
fn arch_uninstall(pkg) {
	return "bin=$(command -v yay || command -v paru); $bin -Q "+ pkg + " 2>/dev/null && $bin -R " + pkg +  " --noconfirm";
}
fn arch_postscripts(pkg) {
	return  #{
		post_deploy: arch_install(pkg),
		post_undeploy: arch_uninstall(pkg),
	}
}

fn cargo_install(pkg) {
	return "(cargo binstall -V 2>/dev/null || cargo install cargo-binstall) && cargo binstall " + pkg
}
fn cargo_uninstall(pkg) {
	return "cargo uninstall " + pkg
}
fn cargo_postscripts(pkg) {
	return  #{
		post_deploy: cargo_install(pkg),
		post_undeploy: cargo_uninstall(pkg),
	}
}

fn bun_install(pkg) {
	return "bun install -g " + pkg
}
fn bun_uninstall(pkg) {
	return "bun remove -g " + pkg
}
fn bun_postscripts(pkg) {
	return  #{
		post_deploy: bun_install(pkg),
		post_undeploy: bun_uninstall(pkg),
	}
}

fn uv_tool_install(pkg) {
	return "for p in " + pkg + "; do uv tool install $p; done";
}
fn uv_tool_uninstall(pkg) {
	return "for p in " + pkg + "; do uv tool uninstall $p; done";
}
fn uv_tool_postscripts(pkg) {
	return  #{
		post_deploy: uv_tool_install(pkg),
		post_undeploy: uv_tool_uninstall(pkg),
	}
}
