$(document).on("turbolinks:load", function() {
  $("#ordertype").change(get_order);
});

function get_order() {
  var type_order = $(this).val();
  var current_url = window.location.pathname;
  $.ajax({
    url: current_url + "/update_posts_order",
    type: "get",
    data: { type_order }
  });
}
