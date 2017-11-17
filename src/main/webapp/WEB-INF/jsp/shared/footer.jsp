<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		</div>
		
		<footer style="text-align:center">
			 &copy; 2017 CLE Brews Inc. &reg; All right reserved.
			 	<c:if test="${not empty currentUser}"> 
				<c:url var="changePasswordHref" value="/users/${currentUser}/changePassword" /><br>
				<a href="${changePasswordHref}">CHANGE PASSWORD</a></li>
			</c:if>
		</footer>
	</body>
</html>