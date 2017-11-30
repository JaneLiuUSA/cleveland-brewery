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
		
	$("form").validate({
		rules : {
			name : {
				required : true,
			},
			abv : {
				required : true,
				number : true,
			},
			ibu : {
				required : true,
				digits : true,
			},
			info : {
				required : true,
			},
			imgUrl : {
				required : true,
			},
		},
			messages : {
				name : {
					required : "required",
				},
				abv : {
					required : "required",
				},
				ibu : {
					required : "required",
				},
				info : {
					required : "required",
				},
				imgUrl : {
					required : "required",
				},
			},
			errorClass : "error"
		});


</script>

<c:url var="formAction" value="/addBeer" />
<form:form method="POST" action="${formAction}" modelAttribute="newBeer">

	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<input type="hidden" name="breweryId" value="${brewery.id}"/>

	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="name">Beer Name: </label>
				<form:input path="name"  placeHolder="Beer Name" class="form-control" />
				<form:errors path="name"></form:errors>
			</div>
			<div class="form-group">
				<label for="name">ABV: </label>
				<form:input path="abv"  placeHolder="ABV" class="form-control" />
				<form:errors path="abv"></form:errors>
			</div>
			<div class="form-group">
				<label for="name">IBU: </label>
				<form:input path="ibu"  placeHolder="IBU" class="form-control" />
				<form:errors path="ibu"></form:errors>
			</div>
			<div class="form-group">
				<label for="name">Beer Style: </label>
				<form:input path="type"  placeHolder="Beer Style" class="form-control" />
				<form:errors path="type"></form:errors>
			</div>
			<div class="form-group">
				<label for="name">Description: </label>
				<form:input path="info"  placeHolder="Description" class="form-control" />
				<form:errors path="info"></form:errors>
			</div>
			<div class="form-group">
				<label for="imgUrl">Image: </label>
				<form:input path="imgUrl"  class="form-control" />
				<input id="hiddenButton4" name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="imgUrl" 
   				data-form-data= "{&quot;upload_preset&quot;:  &quot;brewery_images&quot; }" style="display:none"></input>
   					<label id="topButton4" for="hiddenButton4" class="btn btn-default" >Choose File</label><br>
				<form:errors path="imgUrl"></form:errors>	
			</div>						
		<div>
			<button type="submit" class="btn btn-default">Add New Beer</button><br>
		</div>
	</div>
</div>			
</form:form>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />