// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

function refresh_list() {
  $.get(list_url, function(data) {
    eval(data);
  });
}

function list_show(event) {
  if (event.type === 'page:load') return;
  if ($('body').hasClass('lists show')) {
    setInterval(refresh_list, 3000);
  }
}

$(document).on('page:load', list_show)
$(document).ready(list_show)
