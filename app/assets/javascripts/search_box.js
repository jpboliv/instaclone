$(document).ready(function() {
  $('select#search-box').select2({
    placeholder: "Choose a person",
    allowClear: true,
    theme: "bootstrap"
  });

  $('#search-box').bind('change', function () {
    var url =  $(this).val()
    if (url) {
      window.location.replace(url);
    }
    return false;
  });

});
 
