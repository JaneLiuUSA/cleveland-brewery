<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<c:url value="/javascripts" var="jsUrl"/>
<script type='text/javascript'>

	$(document).ready(function() {
	
		$('.rating').change(function () {
			  var $radio = $(this);
			  $('.rating .selected').removeClass('selected');
			  $radio.closest('label').addClass('selected');
			});
		
		$.validator.addMethod('rating', function(value){
			return value.match(/[1-5]/);
			});
		
		$("form").validate({
			rules : {
				rating : {
					required : true,
					digits: true,
				},
				subject : {
					required : true,
				},
				description : {
					required : true,
				},
			},
				messages : {
					rating : {
						required : "required",
					},
					subject : {
						required : "required",
					},
					description : {
						required : "required",
					},
				},
				errorClass : "error"
			});
	});


</script>

<c:url var="formAction" value="/beerDetails/${beer.id}/review" />
<form:form method="POST" action="${formAction}" modelAttribute="newReview">

	<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}" />
	<input type="hidden" name="beerId" value="${beer.id}"/>


	<div class="row">
	<div>
	<h3 class="Breweries">WRITE YOUR REVIEW FOR</h3>
	</div>
		
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			
			<h3 class="centered2">
				<c:out value="${beer.name}" />
			</h3>
			<div class="col-md-12 breweryImage">
				<img class="center-block" src="<c:out value='${beer.imgUrl}'/>" />
			</div>
			

			<div>
				<label class="col-md-12 star-rating"> Overall Rating</label>
				<fieldset class="star-rating">
	    			<form:radiobutton path="rating" id="star5" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <form:radiobutton path="rating" id="star4" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <form:radiobutton path="rating" id="star3" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <form:radiobutton path="rating" id="star2" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <form:radiobutton path="rating" id="star1" value="1" /><label class = "full" for="star1" title="Gross - 1 star"></label>
				</fieldset><br>
				<br>

			</div>
			<br>
			<div class="form-group">
				<div class="col-md-12">
				<label for="subject">Review Title: </label>
				</div>
				<form:input path="subject" class="form-control" />
				<form:errors path="subject"></form:errors>
			</div>
			<div class="form-group">
				<label for="description">Review: </label>
				<form:input path="description" class="form-control" />
				<form:errors path="description"></form:errors>
			</div>
		<div class="buttonMargin">
			<button type="submit" class="btn btn-default">Submit Your Review</button><br>
		</div>
		</div>
	</div>
</div>			
</form:form>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />


	<!-- <div id="star-rating">
			  <label>
			  		Overall Rating  <input id="star-rating-demo" value="4" type="number" class="rating" min=0 max=5 step=1 data-size="lg">
			  </label>
			  <label>
			    <input type="radio" name="star" value="4" title="4 stars" > 4
			  </label>
			  <label>
			    <input type="radio" name="star" value="3" title="3 stars"> 3
			  </label>
			  <label>
			    <input type="radio" name="star" value="2" title="2 stars"> 2
			  </label>
			  <label>
			    <input type="radio" name="star" value="1" title="1 star"> 1
			  </label>
			</div> -->