<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />


<c:url var="formAction" value="/users" />
<form:form method="POST" action="${formAction}" modelAttribute="currentUser">
<div>
	
	<table class="table">
	<tr>
		<th>User ID</th>
		<th>Username</th>
		<th>Email</th>
		<th>Role</th>
		<th>is Active</th>
	</tr>
	<c:forEach items="${allBrewers}" var="brewer">
		<tr>			
			<td><c:out value="${brewer.id}"/></td>
			<td><c:out value="${brewer.userName}"/></td>
			<td><c:out value="${brewer.email}"/></td>
			<td><c:out value="${brewer.roleId}"/></td>
			<td>
				<input name="active" type="checkbox" data-userName="${brewer.userName}" data-brewer-id="${brewer.id}" ${brewer.active ? 'checked="checked"' : ''}/>
			</td>
		</tr>
	</c:forEach>
	</table>
	
</div>
</form:form>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://www.jqueryscript.net/demo/Create-Simple-Alert-Messages-with-jQuery-Bootstrap-alert-js/alert.js"></script>
<script type="text/javascript">
	$("input[name=active]").on('change',function() {
		 var isActive = $( this ).prop( "checked" );
		 var brewerId = $( this ).attr('data-brewer-id');
		 var userName = $(this).attr('data-userName');
		 
	//	 $('form').append('<input type="hidden" name="actives" value="' + brewerId + ':' + isActive + '">');
	
		$.ajax({
			url: '/capstone/brewerActive',
 			data: {
 				brewerId: brewerId,
 				active: isActive,
 				'CSRF_TOKEN': '${CSRF_TOKEN}',
			},
			type: 'POST'
		}).then(function() {
			const message = "<strong>Success!</strong>  " + userName + " has been updated.";
			$.alert(message, {
				autoClose:true,
				closeTime: 5000,
				type: 'success',
				position: ['center', [-0.42, 0]],
				minTop: 55,
			});
		});
	});
</script>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />