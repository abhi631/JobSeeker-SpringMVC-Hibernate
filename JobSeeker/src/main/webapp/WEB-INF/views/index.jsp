<%@page import="com.spring.model.User"%>
<%@taglib prefix="p" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<p:choose>
	<p:when test="${sessionScope.user != null }">
		<p:when test="${sessionScope.user.getType()=='JobProvider'}">
			<%@ include file="addJob.jsp" %>
		</p:when>
		<p:otherwise>
			<%@ include file="addSkils.jsp" %>
		</p:otherwise>
	</p:when>
	<p:otherwise>
		<%@ include file="login.jsp"%>
	</p:otherwise>
</p:choose>
