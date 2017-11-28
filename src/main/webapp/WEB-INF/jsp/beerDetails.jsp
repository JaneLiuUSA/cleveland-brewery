
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />


<div class="breweryContainer">

	<div class="breweryList">
		<div class="breweryLocation">

			<div class="col-md-12 breweryImage">
				<img class="center-block"
					src="<c:out value='${beer.imgUrl}'/>" />
			</div>
			
			<h2 class="beerDetNames">
				<c:out value="${beer.name}" />
			</h2>
			
			<div class="beerDetButton">
			<a href="${beer.id}/review"><button class="btn btn-default" >Review this Beer</button></a>
			</div>
			
			<div class="breweryLocation">
			<ul>
				<p class="detailsTitle"></p>
				<li><c:out value="${beer.abv}% ABV" /> 
				<li>
					<c:choose> 
						<c:when test="${empty beer.ibu or beer.ibu == 0}">
							N/A IBU
						</c:when>
						<c:otherwise>
							<c:out value=" ${beer.ibu} IBU" />
						</c:otherwise>
					</c:choose>
				</li>
				<li><c:out value="Type: ${beer.type}" /></li>
				<li><c:out value="Info: ${beer.info}" /></li>
				
			</ul>
			
			</div>
			<hr class="hr2"/>
			<div>
				<h3 class="blackText">
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
			<hr class="hr2"/>
			<div>
				<h3 class="blackText"> <c:out value = "Reviews for this beer" /></h3>
				<div>
					<c:forEach items="${reviews}" var="review">
					<ul>
					<li><strong><c:out value = "Review:"/></strong><br>
						<strong><li><c:out value = "${review.subject}" /></li></strong>
						<li><c:out value = "${review.description}" /></li>
						<li><strong><c:out value = "Rating:"/></strong><br>

						

						<c:choose>
							<c:when test="${beer.starRating == 0}">
								No Rating
							</c:when>
							<c:otherwise>
								<c:url var="imageName" value="/img/${review.rating}-star.png"/>
							</c:otherwise>
						</c:choose>

						<img src="${imageName}" class="star-img"/></li>


						<li><c:out value = "${review.formatDateTime}" /></li>
					
					
					</ul>
					</c:forEach>
					
				</div>
			</div>
			
			
		</div>
	</div>
</div>
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />