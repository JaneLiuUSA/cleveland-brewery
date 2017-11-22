<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

	<table class="beer-list-table">
			<th>Name</th>
			<th>ABV</th>
			<th>IBU</th>
			<th>Type</th>
			
		<c:forEach items="${allBeers}" var="beer">
			<tr>
				<td> <c:out value="${beer.name}"/> </td>
				<td> <c:out value="${beer.abv}"/>% </td>
				<td> <c:out value="${beer.ibu}"/> </td>
				<td> <c:out value="${beer.type}"/> </td>
			</tr>	
		</c:forEach>
	</table>
	
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />