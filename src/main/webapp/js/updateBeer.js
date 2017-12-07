
	$.cloudinary.config({
		"cloud_name" : "teclebrew",
		"api_key" : "976593415828521",
		"private_cdn" : false,
		"cdn_subdomain" : false
	});
	
	$(document).ready(function() {
		  if($.fn.cloudinary_fileupload !== undefined) {
		    $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
		  }
		});


	$(document).ready(function() {

		$.validator.addMethod("zipcode", function(value, element) {
			return /\d{5}-\d{4}$|^\d{5}$/.test(value)
		}, "The specified US ZIP Code is invalid");

		$.validator.addMethod('number', function(value) {
			return value.match(/[0-9]/);
		});

		$("form").validate({
			rules : {
				name : {
					required : true,
				},
				abv : {
					required : true,
				},
				ibu : {
					required : true,
				},
				type : {
					zipcode : true,

				},
				phoneNumber : {
					required : true,
					minlength : 10,
					maxlength : 10,
				},
				description : {
					required : true,

				},
			},
			messages : {
				name : {
					required : "required",
				},
				address : {
					required : "required",
				},
				city : {
					required : "required",
				},
				zipcode : {
					required : "required",
				},
				description : {
					required : "required",

				},
				phoneNumber : {
					minlength : "Please enter 10 digits",
					maxlength : "Please enter 10 digits",
				}
			},
			errorClass : "error"
		});

	});