$(document).ready(function() {
  $("#most-liked-tab").click(remove_orderbox);
  $("#my-pics-tab").click(show_orderbox);
});
function remove_orderbox() {
  $("#order-box").hide();
}
function show_orderbox() {
  $("#order-box").show();
}
