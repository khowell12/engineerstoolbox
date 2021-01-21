<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login or Register</title>
    <link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.5.16/dist/css/uikit.min.css" /></head>
<body class="uk-background-primary">
	<nav class="uk-navbar-container uk-navbar">
	<div class="uk-navbar-left">
		<ul class="uk-navbar-nav">
			<li class="uk-activ"><a href="/physics">Physics</a></li>
			<li class="uk-activ"><a href="/electricity">Electricity</a></li>
			<li class="uk-activ"><a href="/thermodynamics">Thermodynamics</a></li>
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
		<li class="uk-activ"><a class="uk-text-secondary">Login</a></li>
		</c:otherwise>
		</c:choose>
	</ul>
	</div>
</nav>
	<div id="wrapper">
	<div class="login centered">
    <h1 class="white-text">Login</h1>
    <p class="text-danger"><c:out value="${error}"/></p>
    <form method="POST" action="/loginUser">
        <div class="form-group">
            <label></label>
            <input class= "uk-input" type="text" id="email" name="email" placeholder="email"/>
        </div>
        <div class="form-group">
            <label for="password"></label>
            <input class="uk-input"type="password" id="password" name="password" placeholder="password"/>
        </div>
        <div class="margin-bottom"></div>
        <input class="uk-button" type="submit" value="Login!"/>
    </form>
    </div>
	 <div class="login centered">
    <h1 class="white-text">Register!</h1>
   		<c:out value="${regErr}"/> 
      <form:form action="/registration" method="POST" modelAttribute="user">
        <div class="form-group">
            <form:label path="firstName"></form:label>
            <form:errors path="firstName" class="uk-text-danger"/>
            <form:input class= "uk-input" path="firstName" placeholder="First Name"/>
        </div>
        <div class="form-group">
            <form:label path="lastName"></form:label>
            <form:errors path="lastName" class="uk-text-danger"/>
			<form:input class= "uk-input" path="lastName" placeholder="Last Name"/>
        </div>          
        <div class="form-group">
            <form:label path="email"></form:label>
            <form:errors path="email" class="uk-text-danger"/>
            <form:input class= "uk-input" type="email" placeholder="Email Address" path="email"/>
        </div>
        <div class="form-group">
            <form:label path="password"></form:label>
            <form:errors path="password" class="uk-text-danger"/>
            <form:password class= "uk-input" path="password" placeholder = "Password"/>
        </div>
        <div class="form-group">
            <form:label path="passwordConfirmation"></form:label>
            <form:errors path="passwordConfirmation" class="uk-text-danger"/>
            <form:password class= "uk-input" path="passwordConfirmation" placeholder="Confirm Passowrd"/>
        </div>
        <div class="margin-bottom"></div>
        <input class="uk-button"type="submit" value="Register!"/>
    </form:form>
    </div>
	
   </div>
</body>
</html>