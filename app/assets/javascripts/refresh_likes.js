$(document).on("turbolinks:load", function() {
  var asking_refresh = setInterval(refresh_likes, 1000);
});

function refresh_likes() {
  console.log("Refresh likes foi chamada");
  $.ajax({
    type: "get",
    url: "/posts/update_likes"
  });
}
