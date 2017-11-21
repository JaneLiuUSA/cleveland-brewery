<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div>
	
	<table>
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
			<td><c:out value="${brewer.isActive}"/></td>
		</tr>
	</c:forEach>
	</table>
</div>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />