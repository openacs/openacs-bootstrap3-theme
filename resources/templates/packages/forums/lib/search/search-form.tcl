# packages/forums/lib/search/search-form.tcl
#
# Form for search box
#
# @author Emmanuelle Raffenne (eraffenne@gmail.com)
# @creation-date 2007-12-23
# @cvs-id $Id$

form create search -action search -has_submit 1
forums::form::search search

if { [form is_request search] && [info exists forum_id] } {
    element set_properties search forum_id -value $forum_id
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
