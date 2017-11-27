<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<c:url var="formAction" value="/breweryBeers" />
<form method="GET" action="${formAction}">
	<div>
		
		<table class="table">
		<tr>
			<th>Name</th>
			<th>ABV</th>
			<th>IBU</th>
			<th>Type</th>
			<th>is Active</th>
		</tr>
		<c:forEach items="${beers}" var="beer">
			<tr>			
				<td><c:out value="${beer.name}"/></td>
				<td><c:out value="${beer.abv}"/></td>
				<td><c:out value="${beer.ibu}"/></td>
				<td><c:out value="${beer.type}"/></td>
				<td>
					<input name="isActive" type="checkbox" data-beer-id="${beer.id}" ${beer.active ? 'checked="checked"' : ''}/>
				</td>
				<td> 
					<input type="hidden" name="beerId" value="<c:out value='${beer.id}'/>" />
					<button type="submit" name="Delete" class="btn btn-default" data-beer-id="${beer.id}">Delete</button> 
				</td>
			</tr>
		</c:forEach>
		</table>
		
	</div>
</form>

<script type="text/javascript">
	$("input[name=isActive]").on('change',function() {
		 var isActive = $( this ).prop( "checked" );
		 var beerId = $( this ).attr('data-beer-id');
		 
	
		$.ajax({
			url: '/capstone/breweryBeerActive',
 			data: {
 				beerId: beerId,
 				isActive: isActive,
 				'CSRF_TOKEN': '${CSRF_TOKEN}',
			},
			type: 'POST'
		});
	});
	
 	$("button[name=Delete]").on('click', function() {
		var beerId = $(this).attr('data-beer-id');
		
		$.ajax({
			url: '/capstone/breweryBeerRemove',
			data: {
				beerId: beerId,
				'CSRF_TOKEN': '${CSRF_TOKEN}',
			},
			type: 'POST'
		});
	}); 
	
</script>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />