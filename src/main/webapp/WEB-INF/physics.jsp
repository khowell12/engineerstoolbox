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
<title>Physics</title>
</head>
<body class = "uk-background-defualt">
<nav class="uk-navbar-container uk-navbar">
	<div class="uk-navbar-left">
		<ul class="uk-navbar-nav">
			<li class="uk-activ"><a class="uk-text-secondary">Physics</a></li>
			<li class="uk-activ"><a href="/electricity">Electricity</a></li>
			<li class="uk-activ"><a href="/thermodynamics">Thermodynamics</a></li>
			<li class="uk-activ"><a href="/fluid-mechanics">Fluids</a></li>
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
<!-- build a discussion topic - make this only appear if session has a user id -->
<!-- add delete button if poster id matches sessions user id -->
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
	<li class="accordion"><h2 class="app-title">Projectile Motion Calculator</h2>
		<div>
		<h4>Find the time to reach maximum height</h4>
		<img src="/PM-T-h.jpg">
		<%--<form:form action = "/PhysicsCalculate" method = "post" modelAttribute ="calc">
			<form:label path="v0"/>
			<form:input path="v0"/>
			<form:label path="theta"/>
			<form:input path="theta"/>
			<input type="submit"/>
		</form:form>--%>
		<p>time : ${time}</p>
		<form id="projectile" name="projectile" action="/PhysicsCalculate" method="post">
			<p><input name="v0" id="v0" value="0" type="text"> Vi (m/s)</p>
			<p><input name="theta" id = "theta" value="0" type="text"> Angle (degrees)</p>
			<input type="submit" class="calculate" value="Calculate">
		</form>
		<!-- <script>
			function calculateProjectileTHeight(vi, theta){
				var ans = (vi.value * Math.sin(Math.PI*(theta.value)/180)/9.81);
				console.log(ans);
				alert(ans.toFixed(3) + " seconds");
				return ans;
			}
		</script> -->
		<h4>Find the total flight time of an object</h4>
		<img src="PM-T-f.jpg">
		<form id="projectile" name="projectile" action="#">
			<p><input name="vi" id="vi" value="0" type="text"> Vi (m/s)</p>
			<p><input name="theta" id = "theta" value="0" type="text"> Angle (degrees)</p>
			<input type="button" onClick="calculateProjectileTime(vi,theta);" value="Calculate">
		</form>
		<script>
			function calculateProjectileTime(vi, theta){
				var ans = 2 * (vi.value * Math.sin(Math.PI*(theta.value)/180)/9.81);
				console.log(ans);
				alert(ans.toFixed(3) + " seconds");
				return ans;
			}
		</script>
		<h4>Find the maximum height of an object</h4>
		<img src="PM-max-h.jpg">
		<form id="projectile" name="projectile" action="#">
			<p><input name="vi" id="vi" value="0" type="text"> Vi (m/s)</p>
			<p><input name="theta" id = "theta" value="0" type="text"> Angle (degrees)</p>
			
		    <input type="button" onClick="calculateProjectileHeight(vi,theta);" value="Calculate">
		</form>
		<script>
			function calculateProjectileHeight(vi, theta){
				var th = (vi.value * Math.sin(Math.PI*(theta.value)/180)/9.81);
				var ans = 0.5*th*th*9.81; 
				console.log(ans);
				alert(ans.toFixed(3) + " meters");
				return ans;
			}
		</script>
		<h4>Find the maximum distance traveled</h4>
		<img src="PM-d-f.jpg">
		<form id="projectile" name="projectile" action="#">
			<p><input name="vi" id="vi" value="0" type="text"> Vi (m/s)</p>
			<p><input name="theta" id = "theta" value="0" type="text"> Angle (degrees)</p>
			<input type="button" onClick="calculateProjectileDist(vi,theta);" value="Calculate">
		</form>
		<script>
			function calculateProjectileDist(vi, theta){
				var ans = (vi.value * vi.value * Math.sin(Math.PI*(theta.value)/90)/9.81);
				console.log(ans);
				alert(ans.toFixed(3) + " Meters");
				return ans;
			}
		</script>
		</div>
	</li>
	
	<li class="accordion">
	<h2 class="app-title">Graphing Calculator</h2>
	<div class="content-centered">
	<div id="calculator" style="width: 600px; height: 400px;"></div>
			<script>
			  var elt = document.getElementById('calculator');
			  var calculator = Desmos.GraphingCalculator(elt);
			  calculator.setExpression({ id: 'graph1', latex: 'y=x^2' });
			</script>
	</div>
	</li>
</ul>
</div>
</div>
</body>
</html>