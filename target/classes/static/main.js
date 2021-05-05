$(document).ready(function() {


$( ".accordion" ).accordion(
		{
	 	active: false,
	 	collapsible: true,
	 			}
	);
$(".calculate").click(function(){
	$.post("/PhysicsCalculate",
		{
			v0 : 52,
			theta: 100
		}
		)
		//,
		//function(status){
		//	alert(status);
		//});
	});

});