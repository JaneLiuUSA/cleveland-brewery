
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="breweryContainer">

	<div class="breweryList">
		<div class="breweryLocation">

			<div class="col-md-12 breweryImage">
				<img class="center-block"
					src="<c:out value='${beer.imgUrl}'/>" />
			</div>
			
			<div>
				<button type="button" class="btn btn-default">Review this Beer</button>
			</div>

			<h2>
				<c:out value="${beer.name}" />
			</h2>
			<div class="breweryLocation">
			<ul>
				<p class="detailsTitle"></p>
				<li><c:out value="${beer.abv}% ABV" /> 
				<li><c:out value=" ${beer.ibu} IBU" /></li>
				<li><c:out value="Type: ${beer.type}" /></li>
				<li><c:out value="${beer.info}" /></li>
				
			</ul>
			
			</div>
			<div>
				<h3>
				<c:out value=" Brewed by:  ${brewery.name}" />
			</h3>
			<div class="breweryLocation">
			<ul>
				<p class="detailsTitle"></p>
				<li><c:out value="${brewery.address}" /> <c:out
						value="${brewery.city}" />
					<c:out value="${brewery.zipcode}" /></li>
				<li><c:out value="${brewery.phoneNumber }" /></li>

				<c:url var="breweryWebsite" value="${brewery.websiteUrl }"></c:url>
				<li><a href=" <c:out value='${breweryWebsite }'/> "><c:out
							value="${brewery.name} Website" /></a></li>

				<li><c:out value="${brewery.businessHours }" /></li>
			</ul>
			</div>

		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />