$("#selectId").on("change", function(e){
	date = new Date();
	if(e.target.value == "bank")
	{
	  $("#cash").attr('name','');
      $("#bank").attr('name', $('.temp_information').data('temp'));
	  $("#now").css("display","block");  
	  $("#bank").attr("required", "true");
	  $("#arke").css("display","none");
	  $("#cash").removeAttr("required");
	  $("#cash").val("");
	  $("#date").css("display","block");
	  $("#bank").val("");
      $(".date1").val(date.toLocaleDateString());
	}
	else if(e.target.value == "cash")
	{ 
      $("#bank").attr('name','');
      $("#cash").attr('name', $('.temp_information').data('temp'));
	  $("#now").css("display","none");
	  $("#arke").css("display","block");  
	  $("#cash").attr("required", "true");
	  $("#bank").removeAttr("required");
	  $("#bank").val("");
	  $("#date").css("display","block");
      $(".date1").val(date.toLocaleDateString());
	}	 
	else 
	{
	  $("#now").css("display","none"); 
	  $("#date").css("display","none");
	  $(".date1").val(""); 
	  $("#arke").css("display","none"); 
	  $("#bank").removeAttr("required");
	  $("#cash").removeAttr("required");
	  $("#bank").val("");
	  $("#cash").val("");
	}
});


$(document).on('change', "input[name='payment_method']", function() {
  $("#suggest_and_edit").toggle(!$('#permanent_closed').is(':checked'));
}).trigger('change');