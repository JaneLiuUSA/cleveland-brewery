<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />
<c:url value="/javascripts" var="jsUrl"/>
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
				googleMapsUrl : {
					required : true,
				},
				lat : {
					required : true,
				},
				lng : {
					required : true,
				},
			/* confirmPassword : {
				required : true,		
				equalTo : "#password"  
			} */
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
				},
				googleMapsUrl : {
					required : "required",
				},
				lat : {
					required : "required",
				},
				lng : {
					required : "required",
				},
			/* confirmPassword : {
				equalTo : "Passwords do not match"
			} */
			},
			errorClass : "error"
		});

	});
</script>
<c:if test="${message != null }">
	<h2>
	<c:out value="${message }"/>
	</h2>

</c:if>
<c:url var="formAction" value="/breweries" />
<form:form method="POST" action="${formAction}" modelAttribute="newBrewery">
<input type="hidden" name="destination" value="${param.destination}"/>
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />

	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="name">Brewery Name: </label>
				<form:input path="name"  placeHolder="Brewery Name Required" class="form-control" />
				<form:errors path="name"></form:errors>
				<c:if test="${message != null }"> <c:out value="${message }"/></c:if>
			</div>
			<div class="form-group">
				<label for="address">Brewery Address: </label>
				<form:input path="address"  placeHolder="Brewery Address Required" class="form-control" />
				<form:errors path="address"></form:errors>
			</div>
			<div class="form-group">
				<label for="city">City: </label>
				<form:input path="city"  placeHolder="City Required" class="form-control" />
				<form:errors path="city"></form:errors>
			</div>	
			<div class="form-group">
				<label for="zipcode">Zip Code: </label>
				<form:input path="zipcode"  placeHolder="Zip Code Required" class="form-control" />
				<form:errors path="zipcode"></form:errors>
			</div>	
			<div class="form-group">
				<label for="phoneNumber">Phone Number: </label>
				<form:input path="phoneNumber" placeHolder="Please enter 10 digits " class="form-control" />
				<form:errors path="phoneNumber"></form:errors>
			</div>	
			<div class="form-group">
				<label for="description">Description: </label>
				<form:input path="description"  placeHolder="Description Required" class="form-control" />
				<form:errors path="description"></form:errors>
			</div>	
			<div class="form-group">
				<label for="breweryLogoUrl">Brewery Logo: </label>
				<form:input path="breweryLogoUrl"  class="form-control" />  
				<input id="hiddenButton1" name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="breweryLogoUrl" 
   				data-form-data= "{&quot;upload_preset&quot;:  &quot;brewery_images&quot; }" style="display:none"></input>
   				<label id="topButton1" for="hiddenButton1" class="btn btn-default" >Choose File</label><br>
				<form:errors path="breweryLogoUrl"></form:errors>
			</div>	
			<div class="form-group">
				<label for="imgUrl">Brewery Image: </label>
				<form:input path="imgUrl"  class="form-control" />
				<input id="hiddenButton2"  name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="imgUrl" 
   				data-form-data= "{&quot;upload_preset&quot;:  &quot;brewery_images&quot; }" style="display:none"></input>
   				<label id="topButton2" for="hiddenButton2" class="btn btn-default" >Choose File</label><br>
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
			<div class="form-group">
				<label for="googleMapsUrl">Google Maps Url: </label>
				<form:input path="googleMapsUrl"  class="form-control" />
				<form:errors path="googleMapsUrl"></form:errors>
				<p>Please start your web address with https://</p>
			</div>
			<div class="form-group">
				<label for="lat">Latitude: </label>
				<form:input path="lat"  class="form-control" />
				<form:errors path="lat"></form:errors>
			</div>
			<div class="form-group">
				<label for="lng">Longitude: </label>
				<form:input path="lng"  class="form-control" />
				<form:errors path="lng"></form:errors>
			</div>
											
			<div>
			<button type="submit" class="btn btn-default addBreweryButton">Create New Brewery</button><br>
			
		</div>
	</div>
</div>

			
</form:form>




<c:import url="/WEB-INF/jsp/shared/footer.jsp" />