// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function rsvp_attending(rsvp_answer) {
    if (rsvp_answer) {
        $('div.rsvp_yes input').enable();
        $('div.rsvp_yes').appear();
    } else {
        $('div.rsvp_yes input').disable();
        $('div.rsvp_yes').fade();
    }
}
