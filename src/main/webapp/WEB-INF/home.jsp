<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="style.css">
<title>Engineering Toolbox V2</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.5.16/dist/css/uikit.min.css" />

</head>
<body class="uk-background-primary">
<div id="wrapper"class="uk-background-primary">
<div id="title">
<div id="title-left">
<h1 class="white-text title-margin">Engineering toolbox V2</h1>
</div>
<div id="title-right">
<c:choose>
		<c:when test="${user_id != null}">
		<a href ="/logout" class="white-text">Logout</a>
		</c:when>
		<c:otherwise>
		<a href ="/login" class="white-text">Login</a>
		</c:otherwise>
		</c:choose>
</div>
</div>
<div>
<c:choose>
<c:when test="${user_id == null }">
<h3 class="white-text title-margin">Welcome! Select a topic to learn about</h3>
</c:when>
<c:otherwise>
<h3 class="white-text title-nargin"> Welcome, ${user.firstName}! Select a topic to learn about</h3>
</c:otherwise>
</c:choose>
</div>
<ul class = "ul-card uk-animation-fade">
	<li><a href="/physics">Physics</a></li>
	<li><a href="/electricity">Electricity</a></li>
	<li><a href="/thermodynamics">Thermodynamics</a></li>
	<li><a href="/fluid-mechanics">Fluid Mechanics</a></li>
</ul>
<div id="home-bottom">
</div>
</div>
</body>
</html>