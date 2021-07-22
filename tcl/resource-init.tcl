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

foreach URN [dict keys [dict get $resource_info urnMap]] {
    template::register_urn \
        -urn $URN \
        -resource $prefix/[dict get $resource_info urnMap $URN] \
        -csp_list [expr {[dict exists $resource_info csp_lists $URN]
                         ? [dict set $resource_info csp_lists $URN]
                         : ""}]
}

template::register_urn \
    -urn urn:ad:js:jquery \
    -resource /resources/openacs-bootstrap3-theme/js/jquery-3.6.0.min.js

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
