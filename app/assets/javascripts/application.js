// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
'use strict';
  //sign up tab change;
$(document).on('shown.bs.tab','a[data-toggle="tab"]', function (e) {
  let target = $(e.target).attr("href"); // activated tab
  if(target=="#customer")
    $("#user_user_type").val("c");
  else
    $("#user_user_type").val("p");
});
