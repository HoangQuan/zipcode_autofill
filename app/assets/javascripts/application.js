// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


   $(document).ready(function() {
        // Interactive Zipcodes
        $('input.zipcode_interactive').blur(function(data) {
            var elem_id = $(this).attr("id");
            var base_id = elem_id.substring(0, elem_id.lastIndexOf("_"));
            $.get("/zipcodes/get_zip_data/" + this.value, {},
            function(data) {
                var zipcode = $.parseJSON(data);
                var city = $('#' + base_id + '_city');
                var state = $('#' + base_id + '_state');
                var county = $('#' + base_id + '_county');
                if (zipcode.err) {
                    alert(zipcode.err);
                } else {
                    city.val(zipcode.city);
                    state.val(zipcode.state)
                    county.val(zipcode.county)
                }
            })
        });
    });

