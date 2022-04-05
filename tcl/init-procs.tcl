namespace eval openacs_bootstrap3_theme {
    set bootstrap_version 3.4.1

    ad_proc -private ::openacs_bootstrap3_theme::resource_info {} {

	Get information about available version(s) of the bootstrap
	packages. The goal is to deliver resources either from the
	local filesystem, or from CDN.

	@return dict containing resourceDir, resourceName, cdn,
		cdnHost, prefix, cssFiles, jsFiles and extraFiles.

    } {
	#
	# Provide paths for loading either via resources or CDN
	#
	set resourceDir [acs_package_root_dir openacs-bootstrap3-theme/www/resources/bootstrap]
	set resourceUrl /resources/openacs-bootstrap3-theme/bootstrap
	set cdn         "//maxcdn.bootstrapcdn.com/bootstrap"
	set version     $openacs_bootstrap3_theme::bootstrap_version

	if {[file exists $resourceDir/$version]} {
	    set prefix  $resourceUrl/$version
	    set cdnHost ""
	} else {
	    set prefix $cdn/$version
	    set cdnHost maxcdn.bootstrapcdn.com
	}

	lappend result \
	    resourceName "Bootstrap 3" \
	    resourceDir $resourceDir \
	    cdn $cdn \
	    cdnHost $cdnHost \
	    prefix $prefix \
	    cssFiles {css/bootstrap.min.css} \
	    jsFiles  {js/bootstrap.min.js} \
	    extraFiles {
		fonts/glyphicons-halflings-regular.woff
		fonts/glyphicons-halflings-regular.woff2
		fonts/glyphicons-halflings-regular.ttf
		css/bootstrap.min.css.map
	    } \
	    urnMap {
		urn:ad:css:bootstrap3 css/bootstrap.min.css
		urn:ad:js:bootstrap3  js/bootstrap.min.js
	    }
        if {$cdnHost ne ""} {
            lappend result cspMap [subst {
                urn:ad:css:bootstrap3 {
                    style-src $cdnHost
                    font-src $cdnHost
                }
                urn:ad:js:bootstrap3 {
                    script-src $cdnHost
                }
            }]
        }
	return $result
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
