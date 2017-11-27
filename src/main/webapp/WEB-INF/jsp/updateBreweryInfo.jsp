<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/jquery.iframe-transport.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/jquery.fileupload.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/vendor/jquery.ui.widget.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cloudinary-jquery-file-upload/2.3.0/cloudinary-jquery-file-upload.min.js"></script>
<script type='text/javascript'>

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
				address : {
					required : true,
				},
				city : {
					required : true,
				},
				zipcode : {
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
</script>

<c:url var="formAction" value="/updateBreweryInfo" />
<form:form method="POST" action="${formAction}" modelAttribute="brewery">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<input type="hidden" name="id" value="${brewery.id}"/>
	
	<div class="row">
		<div class="col-sm-4">
			 <h3>Edit Brewery Information</h3>
		</div>
		
		<div class="col-sm-4">
				<div class="form-group">
					<label for="name" >Name: </label>
					<form:input path="name" class="form-control" />
					<form:errors path="name"></form:errors>
				</div>
				<div class="form-group">
					<label for="address"> Address: </label>
					<form:input path="address" class="form-control" />
					<form:errors path="address"></form:errors>
				</div>
				<div class="form-group">
					<label for="city"> City: </label>
					<form:input path="city" class="form-control" />
					<form:errors path="city"></form:errors>
				</div>
				<div class="form-group">
					<label for="zipcode"> Zip code: </label>
					<form:input path="zipcode" class="form-control" />
					<form:errors path="zipcode"></form:errors>
				</div>
				<div class="form-group">
					<label for="phoneNumber"> Phone number: </label>
					<form:input path="phoneNumber" class="form-control" />
					<form:errors path="phoneNumber"></form:errors>
				</div>
				<div class="form-group">
					<label for="description"> Description: </label>
					<form:input path="description" class="form-control" />
					<form:errors path="description"></form:errors>
				</div>
				<div class="form-group">
					<label for="breweryLogoUrl"> Brewery Logo: </label>
					<form:input path="breweryLogoUrl" class="form-control" />
					<input name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="breweryLogoUrl" 
   				data-form-data= "{&quot;upload_preset&quot;:  &quot;brewery_images&quot; }" style='width:40%' ></input>
   				<img src="<c:out value='${brewery.breweryLogoUrl}'/>" style='width:40%' />
					<form:errors path="breweryLogoUrl"></form:errors>
				</div>
				
				<div class="form-group">
					<label for="imgUrl">Brewery Image: </label>
					<form:input path="imgUrl"  class="form-control" />
					<input name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="imgUrl" 
	   				data-form-data= "{&quot;upload_preset&quot;:  &quot;brewery_images&quot; }" ></input>
	   				<img src="<c:out value='${brewery.imgUrl}'/>" style='width:40%' />
					<form:errors path="imgUrl"></form:errors>
				</div>	
				<div class="form-group">
					<label for="websiteUrl">Web Site URL: </label>
					<form:input path="websiteUrl"  class="form-control" />
					<form:errors path="websiteUrl"></form:errors>
				</div>	
				<div class="form-group">
					<label for="businessHours">Business Hours: </label>
					<form:input path="businessHours"  class="form-control" />
					<form:errors path="businessHours"></form:errors>
				</div>
				<div>
					<button type="submit" class="btn btn-default">Update</button><br>
				</div>
		</div>


		
</form:form>



<c:import url="/WEB-INF/jsp/shared/footer.jsp" />