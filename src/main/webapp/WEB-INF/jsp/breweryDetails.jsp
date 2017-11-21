<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="breweryContainer">
	
		<div class="breweryList">			
			<div class="breweryLocation">
						
				<div class="col-md-12 breweryImage responsive"> <img class="center-block" src="<c:out value='${details.breweryLogoUrl}'/>" /> </div>
				
				<h2 class="namePadding"><c:out value="${details.name}"/></h2>
				<ul>
					<li><c:out value="${details.address}"/> <c:out value="${details.city}"/><c:out value="${details.zipcode}"/> </li>
					<li><c:out value="${details.phoneNumber }"/></li>
					<li><c:out value="${details.description }"/></li>
<%-- 					<li><c:out value="${details.imgUrl }"/></li> --%>
					
					<c:url var="breweryWebsite" value="${details.websiteUrl }"></c:url>
					<li><a href=" <c:out value='${breweryWebsite }'/> "><c:out value="${details.name } Website"/></a></li>
					
					<li><c:out value="${details.businessHours }"/></li>
				</ul>
			</div>
	</div>
	</div>


<c:import url="/WEB-INF/jsp/shared/footer.jsp" />