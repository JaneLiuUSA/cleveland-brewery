<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div>
	<h3 class="Breweries">CLE Brews</h3>
</div>

<div class="backgroundPic">
<div class="breweryContainer">
			
		<c:forEach items="${allBeers}" var="beer">
			
			<div class="row">
			<div class="col-lg-12 breweryList">
			<div class="breweryImage clickHover grow"> 	
				<c:url var="beerDetailLink" value="/beerDetails/${beer.id}"></c:url>
					<a href=" <c:out value='${beerDetailLink}'/> "><img src="<c:out value='${beer.imgUrl}'/>" style="width:20%" /></a>
			</div>
			<div class="breweryLocation">	
			<ul>
				<li><c:out value="${beer.name}"/></li>
				<li><c:out value="${beer.abv}"/>% </li>
				<li><c:out value="${beer.ibu}"/> </li>
				<li><c:out value="${beer.type}"/></li>
				
				<c:forEach items="${allBreweries}" var="brewery">
				<c:set var = "breweryId" value = "${beer.breweryId}"/>
				<c:if test="${brewery.id eq breweryId}">
					<c:out value="${brewery.getNameById(beer.breweryId)}"/> 
			
				</c:if>
				</c:forEach>
				
				<li><a href="../beerDetails/${beer.id}/review"><button class="btn btn-default" >Review this Beer</button></a></li>
				</ul>
				</div>	
			</div>	
		</div>	
		</c:forEach>
		</div>
	
	
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />