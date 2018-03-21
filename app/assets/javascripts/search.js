document.addEventListener("turbolinks:load", function() {
  $input = $("[data-behavior='autocomplete']")

  var options = {
    getValue: "user_name",
    url: function(phrase) {
      return "/search.json?q=" + phrase;
    },
    categories: [
      {
        listLocation: "users",
      }
    ],
    list: {
      onChooseEvent: function() {
        var url = "/user/"+$input.getSelectedItemData().user_name
        console.log(url);
        $input.text("")
        Turbolinks.visit(url)
      }
    }
  }

  $input.easyAutocomplete(options)
});
