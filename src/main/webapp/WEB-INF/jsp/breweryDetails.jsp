<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="row">
<!-- <div class="breweryContainer"> -->

	<div class="breweryList">
		<div class="breweryLocation">

			<div class="col-md-6 breweryDetImage">
				<img class="center-block"
					src="<c:out value='${details.breweryLogoUrl}'/>" />
			</div>
			<div class="col-md-6">
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
				<li><a href=" <c:out value="${breweryWebsite}"/> " target="_blank"> <c:out
							value="${details.name }" /> </a></li>
				<div style="color:black"><strong>Hours</strong></div>
				<li><c:out value="${details.businessHours }" /></li>
			</ul>
			</div>
			</div>
		</div>
		<div class="breweryLocation">
		<table>
				<c:forEach items="${beers}" var="beer">
			<tr>
				<td><c:url var="beerDetailLink" value="/beerDetails/${beer.id}"></c:url>
					<a href=" <c:out value='${beerDetailLink}'/> "><img src="<c:out value='${beer.imgUrl}'/>" style='width:40%' /></a></td>
				<td> <c:out value="${beer.name}"/> </td>
				<td> ABV<c:out value="${beer.abv}"/>% </td>
				<td> IBU<c:out value="${beer.ibu}"/> </td>
				<td> <c:out value="${beer.type}"/> </td>
				<td>
				<c:forEach items="${allBreweries}" var="brewery">
				<c:set var = "breweryId" value = "${beer.breweryId}"/>
				<c:if test="${brewery.id eq breweryId}">
					<c:out value="${brewery.getNameById(beer.breweryId)}"/> 
				</c:if>
				</c:forEach>
				</td>
				<td>
					<a href="../beerDetails/${beer.id}/review"><button class="btn btn-default" >Review this Beer</button></a>
				</td>
			</tr>	
			</c:forEach>
		</table>
		</div>
		
	</div>
</div>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />