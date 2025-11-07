fn some_function(data) {
    "echo test" + data;
};
fn pkg_install(pkg) {
	return "paru -Sy " + pkg +  " --noconfirm";
}
fn pkg_uninstall(pkg) {
	return "paru -R " + pkg +  " --noconfirm";
}
fn pkg_postscripts(pkg) {
	return  #{
		post_deploy: pkg_install(pkg),
		post_undeploy: pkg_uninstall(pkg),
	}
}
