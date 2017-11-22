<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<c:url var="updateAction" value="/updateBreweryInfo" />
<form action="${updateAction}" id="" method="post">

<h3>Edit Brewery Information</h3>
		<input id="" name="name" placeholder="Brewery Name" type="text" value="" />
		<input id="" name="address" placeholder="Address" type="text" value="" />
		<input id="" name="city" placeholder="City" type="text" value="" />
		<input id="" name="zipcode" placeholder="Zipcode" type="text" value="" />
		<input id="" name="phone_number" placeholder="Phone Number" type="text" value="" />
		<input id="" name="description" placeholder="Brewery Description" type="text" value="" />
		<input id="" name="brewery_logo" placeholder="Brewery Logo" type="text" value="" />
		<input id="" name="website_url" placeholder="Website Url" type="text" value="" />
		<input id="" name="business_hours" placeholder="Business  Hours" type="text" value="" />
		
</form>
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />