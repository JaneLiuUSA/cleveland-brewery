<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />


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
		
</form:form>



<c:import url="/WEB-INF/jsp/shared/footer.jsp" />