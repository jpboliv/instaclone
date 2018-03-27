$(document).on("turbolinks:load", function() {
  $("#order-button").click(function(event) {
    document.getElementById("dropdown-orderbox").classList.toggle("show");
  });
});

$(document).on("turbolinks:load", function() {
  $(".order-list").click(function() {
    var type_order = $(this).attr("data-order");
    $("#current-order")[0].innerHTML = type_order;
    $(this)
      .siblings()
      .removeClass("order-list-selected");
    $(this).addClass("order-list-selected");
    var current_url = window.location.pathname;
    $.ajax({
      url: current_url + "/update_posts_order",
      type: "get",
      data: { type_order }
    });
  });
});

window.onclick = function(event) {
  if (!event.target.matches(".dropbtn")) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains("show")) {
        openDropdown.classList.remove("show");
      }
    }
  }
};
