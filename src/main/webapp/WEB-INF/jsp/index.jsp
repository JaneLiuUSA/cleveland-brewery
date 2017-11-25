<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div id="myCarousel" class="carousel slide" data-interval="false">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="http://res.cloudinary.com/teclebrew/image/upload/v1511214076/amber_beer_vqd5xw.jpg" alt="Beer taps">
        <div class="carousel-caption">
          <h3>Cleveland Brews</h3>
          <p>Explore Some of Cleveland's Top Breweries.</p>
        </div>      
      </div>

      <div class="item">
        <img src="http://res.cloudinary.com/teclebrew/image/upload/v1511207908/platformBeer_g0km7c.jpg" alt="GL Porter">
        <div class="carousel-caption">
          <h2 class="title">Platform Brewery</h2>
          <p>Check out one of Cleveland's newest breweries!</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="http://res.cloudinary.com/teclebrew/image/upload/v1511214071/brown_beer_aassb3.jpg" alt="Market Garden">
        <div class="carousel-caption">
          <h3>Market Garden</h3>
          <p>Market Garden journey!</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>


<div id="band" class="container text-center">
  <h2>CLEVELAND BREWS</h2>
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. 
Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. 
Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. 
Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. 
Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. 
Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. 
Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. </p>  <br>
  <div class="row">
    <div class="col-sm-4">
      <p class="text-center"><strong>Masthead Brewery</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="img/mastheadBeer.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Guitarist and Lead Vocalist</p>
        <p>Loves long walks on the beach</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Goldhorn Brewery</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="img/goldhorn.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Drummer</p>
        <p>Loves drummin'</p>
        <p>Member since 1988</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>Great Lakes Brewery</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="img/greatlakes.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>Bass player</p>
        <p>Loves math</p>
        <p>Member since 2005</p>
      </div>
    </div>
  </div>
</div>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />
	