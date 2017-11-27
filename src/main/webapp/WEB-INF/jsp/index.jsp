<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://res.cloudinary.com/teclebrew/image/upload/v1511214076/amber_beer_vqd5xw.jpg" alt="BeerPic">
        <div class="carousel-caption">
          <h3>Cleveland Brews</h3>
          <p>Explore Some of Cleveland's Top Breweries.</p>
        </div>      
      </div>

      <div class="item">
        <img src="https://res.cloudinary.com/teclebrew/image/upload/v1511207908/platformBeer_g0km7c.jpg" alt="PlatformBrewery">
        <div class="carousel-caption">
          <h2 class="title">Platform Brewery</h2>
          <p>Check out one of Cleveland's newest breweries!</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="http://res.cloudinary.com/teclebrew/image/upload/v1511811243/market-garden-brewery-tap-handles-6_1200xx6000-3381-0-0_ctykgf.jpg" alt="MarketGarden">
        <div class="carousel-caption">
          <h2 class="title">Market Garden</h2>
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
  <h2 class="homeTitle">CLEVELAND BREWS</h2>
  <hr/>
<p>Here at Cleveland Brews, we love beer as much as you do. And when we say beer, we mean Cleveland beer. Founded by a group of ambitious boot camp grads,
we followed our passion to bring you closer to the Cleveland Beer scene. From finding your local brewery to checking out new beers, Cleveland Brews is
here to keep you up to date on those hopped up buds. Take a look around and get involved! Cheers! </p>  <br>
 <h2 class="homeTitle">TOP RATED THIS MONTH</h2>
 <hr/>
  <div class="row">
    <div class="col-sm-4">
     <p class="text-center homeTitle"><strong>BREWERY</strong></p><br>
      <p class="text-center"><strong>Masthead Brewery</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="img/mastheadBeer.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo" class="collapse">
        <p>Opened 2016</p>
        <p>Top Beer Goes Here</p>
        <p>Rating Goes Here</p>
      </div>
    </div>
    <div class="col-sm-4">
    <p class="text-center homeTitle"><strong>BEER</strong></p><br>
      <p class="text-center"><strong>Goldhorn Brewery</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="img/goldhorn.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo2" class="collapse">
        <p>Beer Description</p>
        <p>Link To Top Review Goes Here</p>
        <p>Rating Goes Here</p>
      </div>
    </div>
    <div class="col-sm-4">
    <p class="text-center homeTitle"><strong>REVIEW</strong></p><br>
      <p class="text-center"><strong>Great Lakes Brewery</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="img/greatlakes.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
      </a>
      <div id="demo3" class="collapse">
        <p>Review Title Goes Here</p>
        <p>Reviewer Name Goes Here</p>
        <p>Link to review?</p>
      </div>
    </div>
  </div>
</div>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />
	