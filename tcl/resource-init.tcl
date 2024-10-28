#
# Register some URNs
#
::util::resources::register_urns -prefix openacs_bootstrap3_theme

template::register_urn \
    -urn urn:ad:js:jquery \
    -resource /resources/openacs-bootstrap3-theme/js/jquery-3.7.1.min.js

::template::CSS registerCSSclasses bootstrap {
    action "btn btn-default"
    btn-default btn-default
    bulk-action "btn btn-default"
    card "panel panel-default"
    card-body panel-body
    card-header panel-heading
    d-none hidden
    form-action "btn btn-default"
    margin-form ""
    text-warning text-warn
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
