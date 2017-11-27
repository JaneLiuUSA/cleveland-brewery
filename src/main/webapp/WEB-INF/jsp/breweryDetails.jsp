<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />


 <div class="breweryContainer"> 
 <div class="row">

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
		</div>
		
		
		<div class="breweryContainer">
		<c:forEach items="${beers}" var="beer">
	
			<div class="col-lg-12 breweryList">
			<div class="breweryLocation breweryImage">
				<c:url var="beerDetailLink" value="/beerDetails/${beer.id}"></c:url>
					<a href=" <c:out value='${beerDetailLink}'/> "><img src="<c:out value='${beer.imgUrl}'/>"><!--  style='width:40%' /> --></a></td>
				<ul>	
					<li><c:out value="${beer.name}"/></li>
					<li>ABV<c:out value="${beer.abv}"/>% </li>
					<li>IBU<c:out value="${beer.ibu}"/> </li>
					<li><c:out value="${beer.type}"/> </li>
				</ul>
				<c:forEach items="${allBreweries}" var="brewery">
				<c:set var = "breweryId" value = "${beer.breweryId}"/>
				<c:if test="${brewery.id eq breweryId}">
					<c:out value="${brewery.getNameById(beer.breweryId)}"/> 
				</c:if>
				</c:forEach>
				
				 <button type="button" class="btn btn-default">Review this Beer</button></td>
			
				</div>
			</div>
			</div>
			</c:forEach>
			</div>
			</div>
		
	
<%-- <c:forEach items="${allBreweries}" var="brewery"> --%>
	
		
<!-- 		<div class="row"> -->
<!-- 		<div class="col-lg-12 breweryList">			 -->
<!-- 			<div class="breweryImage clickHover grow">  -->
<%-- 			<c:url var="breweryLink" value="/breweryDetails/${brewery.id}"></c:url> --%>
<%-- 			<a href=" <c:out value='${breweryLink}'/> "> <img src="<c:out value='${brewery.breweryLogoUrl}'/>" /> </a></div> --%>
<!-- 			<div class="breweryLocation"> -->
<!-- 				<div class="clickHover2 grow"> -->
<%-- 				<c:url var="breweryLink" value="/breweryDetails/${brewery.id}"></c:url> --%>
<%-- 				<h2> <a href=" <c:out value='${breweryLink}'/> "><c:out value="${brewery.name}"/></a></h2> --%>
<!-- 				</div> -->
<!-- 				<ul> -->
<%-- 					<li> <c:out value="${brewery.address}"/> <c:out value="${brewery.city}"/><br> <c:out value="${brewery.zipcode}"/> </li> --%>
<%-- 					<li><c:out value="${brewery.phoneNumber }"/></li> --%>
<%-- <%-- 					<li><c:out value="${brewery.description }"/></li> --%> --%>
<!-- 				</ul> -->
<!-- 			</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<%-- 	</c:forEach> --%>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />