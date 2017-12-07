<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/jquery.iframe-transport.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/jquery.fileupload.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/blueimp-file-upload/9.19.1/js/vendor/jquery.ui.widget.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cloudinary-jquery-file-upload/2.3.0/cloudinary-jquery-file-upload.min.js"></script>
<script src="upaateBeer.js"></script>

<c:url var="formAction" value="/updateBeerInfo" />
<form:form method="POST" action="${formAction}" modelAttribute="beer">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<input type="hidden" name="id" value="${beer.id}"/>
	
	<div class="row">
		<div class="col-sm-4">
			 <h3>Edit Beer Information</h3>
		</div>
		
		<div class="col-sm-4">
				<div class="form-group">
					<label for="name" >Name: </label>
					<form:input path="name" class="form-control" />
					<form:errors path="name"></form:errors>
				</div>
				<div class="form-group">
					<label for="abv"> ABV: </label>
					<form:input path="abv" class="form-control" />
					<form:errors path="abv"></form:errors>
				</div>
				<div class="form-group">
					<label for="ibu"> IBU: </label>
					<form:input path="ibu" class="form-control" />
					<form:errors path="ibu"></form:errors>
				</div>
				<div class="form-group">
					<label for="type"> Type: </label>
					<form:input path="type" class="form-control" />
					<form:errors path="type"></form:errors>
				</div>
				<div class="form-group">
					<label for="info"> Description: </label>
					<form:textarea path="info" row="5" cols="53" class="form-control"/>
					<form:errors path="info"></form:errors>
				</div>
				
				<div class="form-group">
					<label for="imgUrl">Beer Image: </label>
					<form:input path="imgUrl"  class="form-control" />
					<input id="hiddenButton3" name="file" type="file" class="cloudinary-fileupload" data-cloudinary-field="imgUrl" 
	   				data-form-data= "{&quot;upload_preset&quot;:  &quot;brewery_images&quot; }" style="display:none"></input>
	   					<label id="topButton3" for="hiddenButton3" class="btn btn-default" >Choose File</label><br>
	   				<img src="<c:out value='${beer.imgUrl}'/>" style='width:40%' />
					<form:errors path="imgUrl"></form:errors>
				</div>	
				<div>
					<button type="submit" class="btn btn-default">Update</button><br>
				</div>
		</div>


		
</form:form>



<c:import url="/WEB-INF/jsp/shared/footer.jsp" />