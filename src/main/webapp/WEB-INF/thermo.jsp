<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.5.16/dist/css/uikit.min.css" />
<link rel="stylesheet" href="style.css">
<script src="https://www.desmos.com/api/v1.5/calculator.js?apiKey=dcb31709b452b1cf9dc26972add0fda6"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="main.js"></script>
<title>Thermodynamics</title>
</head>
<body class = "uk-background-defualt">
<nav class="uk-navbar-container uk-navbar">
	<div class="uk-navbar-left">
		<ul class="uk-navbar-nav">
			<li class="uk-activ"><a href="/physics">Physics</a></li>
			<li class="uk-activ"><a href="/electricity">Electricity</a></li>
			<li class="uk-activ"><a class="uk-text-secondary">Thermodynamics</a></li>
			<li class="uk-activ"><a href="/fluid-mechanics">Fluid Mechanics</a></li>
		</ul>
	</div>
	<div class = "uk-navbar-right">
	<ul class ="uk-navbar-nav">
		<li class="uk-activ"><a href ="/">Home</a></li>
		<c:choose>
		<c:when test="${user_id != null}">
		<li class="uk-activ"><a href ="/logout">Logout</a></li>
		</c:when>
		<c:otherwise>
		<li class="uk-activ"><a href ="/login">Login</a></li>
		</c:otherwise>
		</c:choose>
	</ul>
	</div>
</nav>
<div id="wrapper" class = "uk-background-primary">
<div class="content uk-animation-slide-left">
<h1 class="white-text">Discussions</h1>
	<table class="uk-table uk-background-default uk-table-divider">
	<tr>
		<th>Discussion Topics</th>
		<th>By: </th>
		<th></th>
	</tr>
	<c:forEach items = "${discussions}" var = "disc">
		<tr>
		<td><a href = "/physics/${disc.id}"><c:out value = "${disc.title}"/></a></td>
		<td><c:out value = "${disc.poster.firstName}"/></td>
		<c:choose>
			<c:when test = "${user_id == disc.poster.id}">
			<td><a href="delete/${disc.topic}/${disc.id}"><button class="uk-button uk-button-default uk-button-small">Delete</button></a></td>
			</c:when>
		</c:choose>
		</tr>
	</c:forEach>
	</table>
<c:choose>
<c:when test ="${user_id != null}">
<div id="topic-post">
<form:form action = "/discussion" method = "post" modelAttribute = "discussion">
	<form:input type = "hidden" value = "${user_id}" path="poster"/>
	<form:input type = "hidden" value = "${topic}" path = "topic"/>
	<form:label path ="title"/>
	<form:errors path = "title"/>
	<form:textarea rows="2" cols="80" path = "title"/>
	<input type = "submit" value = "Post" id="topic-button" class="uk-button uk-button-default uk-button-small uk-background-default margin-left"/>
</form:form>
</div>
</c:when>
</c:choose>
</div>
<div class="content uk-animation-slide-right content-right">
<h1 class="white-text">Apps</h1>
<ul class="ul-card">
	<li class="accordion"><h2 class="app-title">Engine Efficiency Calculator</h2>
		
		
	</li>
	
	<li class="accordion">
	<h2 class="app-title">Still in R&D - Check back soon!</h2>

	</li>
</ul>
</div>
</div>
</body>
</html>