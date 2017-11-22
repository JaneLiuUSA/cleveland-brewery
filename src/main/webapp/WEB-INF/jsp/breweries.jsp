<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="backgroundPic">
<div class="breweryContainer">

	<c:forEach items="${allBreweries}" var="brewery">
	
		
		<div class="row">
		<div class="col-lg-12 breweryList">			
			<div class="breweryImage clickHover grow"> 
			<c:url var="breweryLink" value="/breweryDetails/${brewery.id}"></c:url>
			<a href=" <c:out value='${breweryLink}'/> "> <img src="<c:out value='${brewery.breweryLogoUrl}'/>" /> </a></div>
			<div class="breweryLocation">
			
				<c:url var="breweryLink" value="/breweryDetails/${brewery.id}"></c:url>
				<h2> <a href=" <c:out value='${breweryLink}'/> "><c:out value="${brewery.name}"/></a></h2>
				<ul>
					<li> <c:out value="${brewery.address}"/> <c:out value="${brewery.city}"/><br><%--  <c:out value="${brewery.zipcode}"/> --%> </li>
					<li><c:out value="${brewery.phoneNumber }"/></li>
<%-- 					<li><c:out value="${brewery.description }"/></li> --%>
				</ul>
			</div>
			</div>
		</div>
	</c:forEach>
	</div>
	
	<!DOCTYPE html>

  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Clustering</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
      position: absolute;
        height: 40%;
     	width: 40%;
     	text-align: center;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>

      function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 41.4920355, lng: -81.6996095},
        });

        // Create an array of alphabetical characters used to label the markers.
        var labels = ['Butcher and the Brewer','Goldhorn','Great Lakes','Masthead','Platform'];

        // Add some markers to the map.
        // Note: The code uses the JavaScript Array.prototype.map() method to
        // create an array of markers based on a given "locations" array.
        // The map() method here has nothing to do with the Google Maps API.
        var markers = locations.map(function(location, i) {
          return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length]
          });
        });

        // Add a marker clusterer to manage the markers.
        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: '/capstone-delta/src/main/webapp/img/m'});
      }
      var locations = [
        {lat: 41.499134, lng: -81.690086}, 
        {lat: 41.521425, lng: -81.651681},
        {lat: 41.484312, lng: -81.704461}, 
        {lat: 41.504100, lng: -81.685403}, 
        {lat: 41.4795909, lng: -81.7138139},
        
      ]
    </script>
    <c:url var="pathMarkers" value="/js/markerclusterer.js"/>
    <script src="${pathMarkers }">
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBC3mur1M8U_H2VkkIPY79clXbZpNg19nI&callback=initMap">
    </script>
 




</div>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />