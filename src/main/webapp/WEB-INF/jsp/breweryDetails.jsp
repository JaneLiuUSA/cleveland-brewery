<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="breweryContainer">

	<div class="breweryList">
		<div class="breweryLocation">

			<div class="col-md-12 breweryImage">
				<img class="center-block"
					src="<c:out value='${details.breweryLogoUrl}'/>" />
			</div>

			<h2>
				<c:out value="${details.name}" />
			</h2>
			<div class="breweryLocation">
			<ul>
				<div style="color:black"><strong>Location</strong></div>
				<li><c:out value="${details.address}" /> <c:out
						value="${details.city}" />
					<c:out value="${details.zipcode}" /></li>
				<div style="color:black"><strong>Phone Number</strong></div>
				<li><c:out value="${details.phoneNumber }" /></li>
				<div style="color:black"><strong>Description</strong></div>
				<li><c:out value="${details.description }" /></li>
				<%-- 					<li><c:out value="${details.imgUrl }"/></li> --%>
				<div style="color:black"><strong>Website</strong></div>
				<c:url var="breweryWebsite" value="${details.websiteUrl }"></c:url>
				<li><a href=" <c:out value='${breweryWebsite }'/> "><c:out
							value="${details.name } Website" /></a></li>
				<div style="color:black"><strong>Hours</strong></div>
				<li><c:out value="${details.businessHours }" /></li>
			</ul>
			</div>

		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />