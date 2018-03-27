$(document).on("turbolinks:load", function() {
  var asking_refresh = setInterval(refresh_likes, 3000);
});

function refresh_likes() {
  $.ajax({
    type: "get",
    url: "/posts/update_likes"
  });
}
