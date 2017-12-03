<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

 
<%-- <c:url var="pwValidationSrc" value="/passwordValidation.js" /> --%>
<%-- <script src="${pwValidationSrc}"></script> --%>

<script type="text/javascript">
	$(document).ready(function () {
	
		$.validator.addMethod('uppercase', function(value) {
			return value.match(/[A-Z]/);
			});
			$.validator.addMethod('lowercase', function(value) {
			return value.match(/[a-z]/);
			});
			$.validator.addMethod('numbers', function(value){
			return value.match(/[0-9]/);
			});
		
		$("form").validate({
			rules : {
				password : {
					required : true,
					minlength : 8,
					maxlength : 128,
					uppercase : true,
					lowercase : true,
					numbers : true,
				},
				userName : {
					required : true
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				},
				email : {
					required : true,
					email : true,
				},
				id : {
					required : true,
					numbers : true,
				},
			},
			messages : {	
				password: {
					minlength: "Password was too short. It should be at least 8 characters.",
					uppercase: "Password must contain at least one uppercase letter",
					lowercase: "Password must contain at least one lowercase letter",
					numbers: "Password must contain one number",
				},
				confirmPassword : {
					equalTo : "Passwords do not match",
				},
				id : {
					numbers: "A brewery must be selected for a new brewer account."
				}
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
<c:url var="formAction" value="/users" />
<form:form method="POST" action="${formAction}" modelAttribute="newUser">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<label for="userName">User Name: </label>
				<form:input path="userName"  placeHolder="User Name" class="form-control" />
				<form:errors path="userName"></form:errors>
				<c:if test="${message != null }"> <c:out value="${message }"/></c:if>
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<form:input type="password" path="password" placeHolder="Password" class="form-control" />
				<form:errors path="password"></form:errors>
				<div class="rules">
				<p>Must be at least 8 characters long and contain the following:
				Uppercase Letter (A-Z), Lowercase Letter (a-z), Number (0-9)</p>	
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label>
				<input type="password" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="email">Email address: </label>
				<form:input path="email" placeHolder="Email Address" class="form-control"/>
				<form:errors path="email"></form:errors>
				<p>**An email will be sent and a phone call will be placed for verification. Account will be verified and accessible within 24 hours.</p>
			</div>
			<div class="form-group">
				<label for="id">Select Brewery</label>
					<select name="id">
						<option value="#">Select a Brewery</option>
						<c:forEach items="${allBreweries}" var="brewery">
							<option value="${brewery.id}"><c:out value="${brewery.name }"/></option>
						</c:forEach>
					</select>
			</div>
			<div>
			<button type="submit" class="btn btn-default">Create User</button><br>
				<br>
			</div>
		</div>
	</div>
</div>

			
</form:form>
		

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />
