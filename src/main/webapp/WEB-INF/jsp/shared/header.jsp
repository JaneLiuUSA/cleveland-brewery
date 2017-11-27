
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		
		<title>CleBrews 
		<c:if test="${not empty currentUser}"> 
 			: <c:out value="${currentUser.userName}"/> 
 		</c:if>	
		</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.js "></script>
	    <script src="https://cdn.jsdelivr.net/jquery.timeago/1.4.1/jquery.timeago.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
	    
		<%-- <link href="path/to/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />

		<!-- important mandatory libraries -->
		<script src="path/to/js/star-rating.js" type="text/javascript"></script>
		<script src="path/to/javascripts/bootstrap-rating-input.min.js" type="text/javascript"></script>

		<!-- optionally if you need translation for your language then include locale file as mentioned below -->
		<script src="path/to/js/locales/<lang>.js"></script>
	    <script src="https://use.fontawesome.com/aad158a7ca.js"></script>  --%>
	    
	    <c:url var="cssHref" value="/css/style.css" />
		<link rel="stylesheet" type="text/css" href="${cssHref}">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

 		<script type="text/javascript"> 
  			$(document).ready(function() { 
  				$("time.timeago").timeago(); 
				
  				$("#logoutLink").click(function(event){ 
  					$("#logoutForm").submit(); 
  				}); 
				
  				var pathname = window.location.pathname; 
  				$("nav a[href='"+pathname+"']").parent().addClass("active"); 
				
  			}); 
	
  		</script> 

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <c:url var="homeRef" value="/"/>
     <p><a class="navbar-brand" href="${homeRef}">CLEVELAND BREWS</a></p>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <c:url var="homePageHref" value="/" /> 
	 	<li><a href="${homePageHref}">HOME</a></li>
	 	
        <c:url var="breweryListHref" value="/breweries/" /> 
 		<li><a href="${breweryListHref}">CLE BREWERIES</a></li> 
 		
        <c:url var="beerListHref" value="/beers/" /> 
		<li><a href="${beerListHref}">CLE BREWS</a></li> 
		
		 
				<ul class="nav navbar-nav navbar-right"> 
					<c:choose>
						<c:when test="${empty currentUser}">
							<c:url var="newUserHref" value="/users/new" />
							
							<c:url var="loginHref" value="/login" />
							<li><a href="${loginHref}">BREWER LOG-IN</a></li>
						</c:when>
						
						<c:otherwise>
							<c:url var="logoutAction" value="/logout" />
							<form id="logoutForm" action="${logoutAction}" method="POST">
								<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
							</form> 
 							<li><a id="logoutLink" href="#">LOG OUT</a></li> 
 							
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${currentUser.roleId == 1 }">
						<c:url var="admindHref" value="/admin" />
						 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="${adminHref}">ADMIN<span class="caret"></span></a>
        					<ul class="dropdown-menu">
        					  <c:url var="brewerAccounts" value="/brewerAccounts" />
        					  <li><a href="${brewerAccounts }">BREWER ACCOUNTS</a></li>
        					  <c:url var="addBrewery" value="/breweries/new" />
        					  <li><a href="${addBrewery}">ADD BREWERY</a></li>
       						</ul>
       					</c:when>
       					</c:choose>
       					
       					<c:choose>
       					<c:when test="${currentUser.roleId == 2 }">
       						 <c:url var="brewerHref" value="/brewer" />
						 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="${brewerHref}">BREWER<span class="caret"></span></a>
        					<ul class="dropdown-menu">
        					  <c:url var="brewerAccount" value="/updateBreweryInfo" />
        					  <li><a href="${brewerAccount}">UPDATE INFO</a></li>
        					  <c:url var="addBeer" value="/addBeer" />
        					  <li><a href="${addBeer}">ADD BEER</a></li>
        					  <c:url var="removeBeer" value="/breweryBeers"/>
        					  <li> <a href="${removeBeer}">REMOVE BEER</a></li>

       						</ul>
     					 </li>
						</c:when>
						</c:choose>
				</ul> 
				</ul>
 			</div> 
 		</nav> 
