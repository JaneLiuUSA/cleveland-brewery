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
					<input name="isActive" type="checkbox"  data-beer-name="${beer.name}" data-beer-id="${beer.id}" ${beer.active ? 'checked="checked"' : ''}/>

				</td>
				<td> 
					<c:url var="updateUrl" value="${beer.id}/updateInfo"/>
					<span class="btn btn-default"><a href="${updateUrl}"><c:out value="Update"/></a></span>
<!-- 					<button name="update" class="btn btn-default" >Update</button> -->
				</td>
				
				<td> 
					<input type="hidden" name="beerId" value="<c:out value='${beer.id}'/>" />
					<button type="submit" name="Delete" class="btn btn-default" data-beer-name="${beer.name}" data-beer-id="${beer.id}">Delete</button> 
				</td>
			</tr>
		</c:forEach>
		</table>
		
	</div>
</form>

<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://www.jqueryscript.net/demo/Create-Simple-Alert-Messages-with-jQuery-Bootstrap-alert-js/alert.js"></script>
<script type="text/javascript">
	$("input[name=isActive]").on('change',function() {
		 var isActive = $( this ).prop( "checked" );
		 var beerId = $( this ).attr('data-beer-id');
		 var beerName = $(this).attr('data-beer-name');
	
		$.ajax({
			url: '/capstone/breweryBeerActive',
 			data: {
 				beerId: beerId,
 				isActive: isActive,
 				'CSRF_TOKEN': '${CSRF_TOKEN}',
			},
			type: 'POST'
		}).then(function() {
			const message = "<strong>Success!</strong>  " + beerName + " has been updated.";
			$.alert(message, {
				autoClose:true,
				closeTime: 5000,
				type: 'success',
				position: ['center', [-0.42, 0]],
				minTop: 55,
			});
		});
	});
	
 	$("button[name=Delete]").on('click', function(event) {
 		event.preventDefault();
		var beerId = $(this).attr('data-beer-id');
		var beerName = $(this).attr('data-beer-name');
		var thisTR = $(this).closest('tr');
		
		$.ajax({
			url: '/capstone/breweryBeerRemove',
			data: {
				beerId: beerId,
				'CSRF_TOKEN': '${CSRF_TOKEN}',
			},
			type: 'POST'
		}).then(function() {
			const message = "<strong>Success!</strong>  " + beerName + " has been removed.";
			$.alert(message, {
				autoClose:true,
				closeTime: 5000,
				type: 'success',
				position: ['center', [-0.42, 0]],
				minTop: 55,
			});
			thisTR.remove();
		}); 
	});
	
</script>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />