$(function() {
  return $(document).on('submit', '#new_comment', function(evt) {
    evt.preventDefault();
    return $.ajax('../comments', {
      type: 'POST',
      dataType: 'script',
      data: {
        content: $("#comment_field").val(),
        business_id: $("#business_id").text()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        return console.log("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        return console.log("Dynamic depot select OK!");
      }
    });
  });
});