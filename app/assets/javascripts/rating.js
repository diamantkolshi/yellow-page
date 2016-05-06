 $(function () {

    $("#rateUser").rateYo({
      rating: 0
   })
                          
});

$(function() {
 return $(document).on('click', '#getRating', function(evt) {
 	evt.preventDefault();
 	 var rateUser = $("#rateUser").rateYo();
   var rating = rateUser.rateYo("rating");

   return $.ajax('../rating/create_rate', {
     type: 'GET',
     dataType: 'script',
     data: {
       rating: rating,
       business: $("#business_id").text(),
       rate_id: $("#rate_id").text()
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