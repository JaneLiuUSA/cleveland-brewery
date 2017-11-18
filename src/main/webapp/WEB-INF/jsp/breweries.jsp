<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="breweryContainer col-md-4">

	<c:forEach items="${allBreweries}" var="brewery">
	
		<c:url var="breweryLink" value="/brewery/${brewery.id}"></c:url>
		<h2> <a href=" <c:out value='${breweryLink}'/> "><c:out value="${brewery.name}"/></a></h2>
		
		<div class="breweryList">			
			<div class="breweryImage"> <img src="<c:out value='${brewery.breweryLogoUrl}'/>" /> </div>
			<div class="breweryLocation">
				<ul>
					<li> <c:out value="${brewery.address}"/> <c:out value="${brewery.city}"/>, <c:out value="${brewery.zipcode}"/> </li>
					<li><c:out value="${brewery.phoneNumber }"/></li>
				</ul>
			</div>
		</div>
	</c:forEach>

</div>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />