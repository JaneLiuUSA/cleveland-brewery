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
		
		$("form").validate({
			rules : {
				rating : {
					required : true,
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
		<h2>WRITE YOUR REVIEW</h2>
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			
			<h3>
				<c:out value="${beer.name}" />
			</h3>
			<div class="col-md-12 breweryImage">
				<img class="center-block" src="<c:out value='${beer.imgUrl}'/>" />
			</div>
			
			<div class="rating">
			  <label>
			    <input type="radio" name="rating" value="5" title="5 stars"> 5
			  </label>
			  <label>
			    <input type="radio" name="rating" value="4" title="4 stars"> 4
			  </label>
			  <label>
			    <input type="radio" name="rating" value="3" title="3 stars"> 3
			  </label>
			  <label>
			    <input type="radio" name="rating" value="2" title="2 stars"> 2
			  </label>
			  <label>
			    <input type="radio" name="rating" value="1" title="1 star"> 1
			  </label>
			</div>
			
			<%-- <div>
				<label class="rating"> Overall Rating</label>
				<fieldset class="rating">
	    			<form:radiobutton path="rating" id="star5" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
				    <form:radiobutton path="rating" id="star4" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
				    <form:radiobutton path="rating" id="star3" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
				    <form:radiobutton path="rating" id="star2" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
				    <form:radiobutton path="rating" id="star1" value="1" /><label class = "full" for="star1" title="Waste of my time - 1 star"></label>
				</fieldset><br>
				<br>
			</div> --%>
			
			<div class="form-group">
				<label for="subject">Review Title: </label>
				<form:input path="subject" class="form-control" />
				<form:errors path="subject"></form:errors>
			</div>
			<div class="form-group">
				<label for="description">Review: </label>
				<form:input path="description" class="form-control" />
				<form:errors path="description"></form:errors>
			</div>
		<div>
			<button type="submit" class="btn btn-default">Submit Your Review</button><br>
		</div>
	</div>
</div>			
</form:form>

<c:import url="/WEB-INF/jsp/shared/footer.jsp" />