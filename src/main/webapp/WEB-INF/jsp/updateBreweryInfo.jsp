<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />


<<<<<<< HEAD
<c:url var="formAction" value="/updateBreweryInfo" />
<form:form method="POST" action="${formAction}" modelAttribute="brewery">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	
		<h3> Edit Brewery Information</h3>
		<div>
				<div class="form-group">
					<label for="name" >Name: </label>
					<form:input path="name" />
					<form:errors path="name"></form:errors>
				</div>
		</div>
		<div>
			<button type="submit" class="btn btn-default">Update</button><br>
		</div>
=======
<h3>Edit Brewery Information</h3>
		<input id="" name="name" placeholder="Brewery Name" type="text" value="" />
		<input id="" name="address" placeholder="Address" type="text" value="" />
		<input id="" name="city" placeholder="City" type="text" value="" />
		<input id="" name="zipcode" placeholder="Zipcode" type="text" value="" />
		<input id="" name="phone_number" placeholder="Phone Number" type="text" value="" />
		<input id="" name="description" placeholder="Brewery Description" type="text" value="" />
		<input id="" name="brewery_logo" placeholder="Brewery Logo" type="text" value="" />
		<input id="" name="website_url" placeholder="Website Url" type="text" value="" />
		<input id="" name="business_hours" placeholder="Business  Hours" type="text" value="" />
>>>>>>> 1ad2bc2f2dd295ad617578dd29baf963e4bd5295
		
</form:form>



<c:import url="/WEB-INF/jsp/shared/footer.jsp" />