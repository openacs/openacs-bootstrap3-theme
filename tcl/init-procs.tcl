namespace eval openacs_bootstrap3_theme {
    set bootstrap_version 3.3.7

    ad_proc -private ::openacs_bootstrap3_theme::resource_info {} {

	Get information about available version(s) of the bootstrap
	packages. The goal is to deliver resources either from the
	local file system, or from CDN.

    } {
	#
	# Provide paths for loading either via resources or CDN
	#
	set resource_dir [acs_package_root_dir openacs-bootstrap3-theme/www/resources]/bootstrap
	set resource_url /resources/openacs-bootstrap3-theme/bootstrap
	set cdn          "//maxcdn.bootstrapcdn.com/bootstrap"
	set version      $openacs_bootstrap3_theme::bootstrap_version

	if {[file exists $resource_dir/$version]} {
	    set prefix $resource_url/$version
	} else {
	    set prefix $cdn/$version
	}

	lappend result \
	    cdn $cdn \
	    resource_dir $resource_dir \
	    prefix $prefix \
	    cssFiles {css/bootstrap.min.css} \
	    jsFiles  {js/bootstrap.min.js} \
	    extraFiles {fonts/glyphicons-halflings-regular.woff fonts/glyphicons-halflings-regular.ttf}

	return $result
    }
}
