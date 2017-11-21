<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<script type="text/javascript">
	$("input[name=active]").on('change',function() {
		 var isActive = $( this ).prop( "checked" );
		 var brewerId = $( this ).attr('data-brewer-id');
		 
	//	 $('form').append('<input type="hidden" name="actives" value="' + brewerId + ':' + isActive + '">');
	
		$.ajax({
			url: 'brewerActive',
			data: {
				brewerId: brewerId,
				active: isActive
			},
			type: 'POST'
		});
	});
</script>

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
				<input name="active" type="checkbox" data-brewer-id="${brewer.id}" ${brewer.active ? 'checked="checked"' : ''}/>
			</td>
		</tr>
	</c:forEach>
	</table>
	
</div>
</form:form>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />