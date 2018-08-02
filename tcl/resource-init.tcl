#
# Register some URNs that we are providing for sharing.
#

set version $::openacs_bootstrap3_theme::bootstrap_version

#
# Get resource info from this package. If not locally installed, offer
# a link for download.
#
set resource_info [::openacs_bootstrap3_theme::resource_info]
set prefix        [dict get $resource_info prefix]
set regnames      {bootstrap.min.js bootstrap3 bootstrap.min.css bootstrap3}

foreach file [concat \
		  [dict get $resource_info cssFiles] \
		  [dict get $resource_info jsFiles] \
	     ] {
    set fn [file tail $file]
    if {[dict exists $regnames $fn]} {
	set ext [string trimleft [file extension $fn] .]
	template::register_urn \
	    -urn urn:ad:${ext}:[dict get $regnames $fn] \
	    -resource $prefix/$file
    } else {
	ns_log warning "openacs-bootstrap3_theme: not registering URN for $file"
    }
}
