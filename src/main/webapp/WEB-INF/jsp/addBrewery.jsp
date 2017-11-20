<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<script type="text/javascript">
	$(document).ready(function () {
		
			$.validator.addMethod("zipcode", function(value, element) {
			    return /\d{5}-\d{4}$|^\d{5}$/.test(value)
			}, "The specified US ZIP Code is invalid");
			
			$validator.addMethod("phoneNumber",function(value){
				return ^\(\d{3}\)\s\d{3}-\d{4}.test(value);
			});

			$.validator.addMethod('number', function(value){
			return value.match(/[0-9]/);
			});
		
		$("form").validate({
			rules : {
				zipcode:{
					zipcode: true,
					
				},
				phoneNumber:{
					phoneNumber: true;
				}
				/* confirmPassword : {
					required : true,		
					equalTo : "#password"  
				} */
			},
			messages : {	
				
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
				<form:input path="phoneNumber" placeHolder="(xxx)xxx-xxxx" class="form-control" />
				<form:errors path="phoneNumber"></form:errors>
			</div>	
			<div class="form-group">
				<label for="description">Description: </label>
				<form:input path="description"  placeHolder="Description Required" class="form-control" />
				<form:errors path="description"></form:errors>
			</div>	
			<div class="form-group">
				<label for="breweryLogoUrl">Brewery Logo: </label>
				<form:input path="breweryLogoUrl"  placeHolder="Logo Required" class="form-control" />
				<form:errors path="breweryLogoUrl"></form:errors>
			</div>	
			<div class="form-group">
				<label for="imgUrl">Brewery Image: </label>
				<form:input path="imgUrl"  class="form-control" />
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
			<button type="submit" class="btn btn-default">Create New Brewery</button><br>
			
		</div>
	</div>
</div>

			
</form:form>




<c:import url="/WEB-INF/jsp/shared/footer.jsp" />