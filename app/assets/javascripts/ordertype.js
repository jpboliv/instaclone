$(document).ready(function() {
  $("#ordertype").change(get_order);
  console.log("detectei mudança no select");
});
function get_order() {
  console.log("entrei no get_order");
  console.log($(this).val());
  var type_order = $(this).val();
  var current_url = window.location.pathname;
  $.ajax({
    url: current_url + "/" + type_order,
    type: "get",
    data: { type_order }
  });
}
