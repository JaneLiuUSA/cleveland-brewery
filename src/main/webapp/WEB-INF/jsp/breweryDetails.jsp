<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div class="breweryContainer">
	
		<div class="breweryList">			
			<div class="breweryLocation">
						
				<div class="col-md-12 breweryImage"> <img class="center-block" src="<c:out value='${details.breweryLogoUrl}'/>" /> </div>
				
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
		
	
<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
      position: absolute;
        height: 30%;
     	width: 30%;
     	text-align: center;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 12
        });
        infoWindow = new google.maps.InfoWindow;

        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBC3mur1M8U_H2VkkIPY79clXbZpNg19nI&callback=initMap">
    </script>
    </div>
	</div>
	</div>


	


<c:import url="/WEB-INF/jsp/shared/footer.jsp" />