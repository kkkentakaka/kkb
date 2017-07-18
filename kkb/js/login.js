$(document).ready(function(){

	$('#registration-form').validate({
    rules: {
			id: {
        required: true,
      },
			username: {
        required: true,
      },
		  password: {
				required: true,
				minlength: 4
			},
		  agree: "required"
	    },
			highlight: function(element) {
				$(element).closest('.control-group').removeClass('success').addClass('error');
			},
			success: function(element) {
				element
				.text('OK!').addClass('valid')
				.closest('.control-group').removeClass('error').addClass('success');
			}
  });

}); // end document.ready
