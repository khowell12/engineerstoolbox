<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${discussion.title}</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.5.16/dist/css/uikit.min.css" />
<link rel="stylesheet" href="/style.css">
</head>
<body class="uk-background-primary">
<nav class="uk-navbar-container uk-navbar">
	<div class="uk-navbar-left">
		<ul class="uk-navbar-nav">
			<li class="uk-activ"><a>Physics</a></li>
			<li class="uk-activ"><a href="/electricity">Electricity</a></li>
			<li class="uk-activ"><a href="/thermodynamics">Thermodynamics</a></li>
			<li class="uk-activ"><a href="/fluids">Fluids</a></li>
		</ul>
	</div>
	<div class = "uk-navbar-right">
	<ul class ="uk-navbar-nav">
		<li class="uk-activ"><a href ="/">Home</a></li>
		<li class="uk-activ"><a href ="/logout">Logout</a></li>
	</ul>
	</div>
</nav>
<div id ="wrapper" class = "uk-background-primary">
<h4 class="h4-discussion uk-text-secondary">Back to <a href="/${discussion.topic}" class="uk-text-secondary">${discussion.topic} page</a></h4>
<h1 class="h1-discussion">${discussion.title}</h1>
<div id = "main-content">
<div class = "uk-card-default">
<c:forEach items = "${messages}" var = "msg">
	<div class = "uk-card-default uk-card-body">
	<div class = "uk-card-title">${msg.msgPoster.firstName}</div>
	<div class = "text-right"><c:out value = "${msg.content}"/></div>
	<p class="text-small">${msg.createdAt}</p>
	</div>
</c:forEach>
<c:choose><c:when test="${user_id != null }">
<form:form action = "/msg" method = "post" modelAttribute = "umsg">
	<form:input type = "hidden" value = "${user_id}" path="msgPoster"/>
	<form:label path="discussion"></form:label>
	<form:select path="discussion"><form:option value="${discussion}">${discussion.title}</form:option></form:select>
	<form:errors path="discussion"/>
	<form:label path ="content"/>
	<form:errors path = "content"/>
	<form:input path = "content"/>
	<input type = "submit" value = "Post"/>
</form:form>
</c:when>
</c:choose>
</div>
</div>
</div>
</body>
</html>