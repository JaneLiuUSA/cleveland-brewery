<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<c:url var="pwValidationSrc" value="/passwordValidation.js" />
<script src="${pwValidationSrc}"></script>

<script type="text/javascript">
	$(document).ready(function () {
	
		$.validator.addMethod('uppercase', function(value) {
			return value.match(/[A-Z]/);
			});
			$.validator.addMethod('lowercase', function(value) {
			return value.match(/[a-z]/);
			});
			$.validator.addMethod('number', function(value){
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
					number : true,
				},
				userName : {
					required : true
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				}
			},
			messages : {	
				password: {
					minlength: "Password was too short. It should be at least 8 characters.",
					uppercase: "Password must contain at least one uppercase letter",
					lowercase: "Password must contain at least one lowercase letter",
					number: "Password must contain one number",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
		
	});
</script>
<c:if test="${errorMessage != null }">
	<h2>
	<c:out value="${errorMessage }"/>
	</h2>

</c:if>
<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<div class="row">
		<div class="col-sm-6">	
			<div class="form-group">
				<label for="userName">User Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm Password: </label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" class="form-control" />	
			</div>
			<button type="submit" class="btn btn-default">Create User</button>
		</div>
	</div>
</form>	
		<div class="col-sm-6">
			<strong>Password Rules:</strong>
			<ul>
				<li>Must be at least 8 characters long</li>
				<li>Must contain the following types of characters:
					<ol>
						<li>Uppercase letter (A-Z)</li>
						<li>Lowercase letter (a-z)</li>
						<li>Number (0-9)</li>
					</ol>
				</li>
			</ul>
		</div>
	

		
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />