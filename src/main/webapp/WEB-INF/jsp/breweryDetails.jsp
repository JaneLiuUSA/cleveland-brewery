<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="breweryContainer">
	
		<div class="breweryList">			
			<div class="breweryImage"> <img src="<c:out value='${brewery.breweryLogoUrl}'/>" /> </div>
			<div class="breweryLocation">
			
				<h2><c:out value="${brewery.name}"/></h2>
				<ul>
					<li><c:out value="${brewery.address}"/> <c:out value="${brewery.city}"/><c:out value="${brewery.zipcode}"/> </li>
					<li><c:out value="${brewery.phoneNumber }"/></li>
					<li><c:out value="${brewery.description }"/></li>
					<li><c:out value="${brewery.imgUrl }"/></li>
					<li><c:out value="${brewery.websiteUrl }"/></li>
					<li><c:out value="${brewery.businessHours }"/></li>
				</ul>
			</div>
	</div>
	</div>


<c:import url="/WEB-INF/jsp/shared/footer.jsp" />