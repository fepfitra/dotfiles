fn some_function(data) {
    "echo test" + data;
};
fn pkg_install(pkg) {
	return "bin=$(command -v paru || command -v yay); $bin -Q "+ pkg + " 2>/dev/null || $bin -S " + pkg +  " --noconfirm";
}
fn pkg_uninstall(pkg) {
	return "bin=$(command -v paru || command -v yay); $bin -Q "+ pkg + " 2>/dev/null && $bin -R " + pkg +  " --noconfirm";
}
fn pkg_postscripts(pkg) {
	return  #{
		post_deploy: pkg_install(pkg),
		post_undeploy: pkg_uninstall(pkg),
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
