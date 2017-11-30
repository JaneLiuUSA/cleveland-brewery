<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div>
	<h3 class="Breweries">CLE Brews</h3>
</div>

<div class="backgroundPic">
<div class="breweryContainer">
			
		<c:forEach items="${allBeers}" var="beer">
			
			<div class="row">
			<div class="col-lg-12 beerList">
			<div class="breweryBeerImage clickHover grow"> 	
				<c:url var="beerDetailLink" value="/beerDetails/${beer.id}"></c:url>
					<a href=" <c:out value='${beerDetailLink}'/> "><img src="<c:out value='${beer.imgUrl}'/>" /></a>
			</div>
			<div class="beerInformation">	
			<ul>
				
				<strong><li class="nameColor"><c:out value="${beer.name}"/></li></strong>
				<li>ABV: <c:out value="${beer.abv}"/>% </li>
				<li>IBU: <c:out value="${beer.ibu}"/> </li>
				<li><c:out value="${beer.type}"/></li>
				
				<c:forEach items="${allBreweries}" var="brewery">
					<c:set var = "breweryId" value = "${beer.breweryId}"/>
					<c:if test="${brewery.id eq breweryId}">
						<c:out value="${brewery.getNameById(beer.breweryId)}"/> 
					<br>
					</c:if>
				</c:forEach>
				<c:choose>
						<c:when test="${empty beer.starRating or beer.starRating == 0}">
							<li class="noReviews">No Reviews</li>
						</c:when>
						<c:otherwise>
								<c:url var="imageName" value="/img/${beer.starRating}-star.png"/>
								<li><img src="${imageName}" class="star-img-medium"/></li>
						</c:otherwise>
					</c:choose>
				<li><a href="../beerDetails/${beer.id}/review"><button class="btn btn-default" >Review this Beer</button></a></li>
				</ul>
			</div>
			</div>
			</div>
		</c:forEach>
				</div>	
			</div>		
		
	
	
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />