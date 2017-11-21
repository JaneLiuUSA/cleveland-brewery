<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/shared/header.jsp" />

<c:url var="updateAction" value="/updateBreweryInfo" />
<form action="${updateAction}" id="" method="post">

<h3>Edit Brewery Information</h3>
		<input id="" name="" placeholder="name" type="text" value="" />
		<input id="" name="" placeholder="address" type="text" value="" />
</form>
<c:import url="/WEB-INF/jsp/shared/footer.jsp" />