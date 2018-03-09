<%@ page contentType="text/html;charset=utf-8" pageEncoding="euc-kr"
%><%@taglib prefix="jl" uri="http://java.sun.com/jsp/jstl/core"
%><!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="common.js"></script>
	<script>
	window.onload = function(){
		var dc = "?_dc=" + new Date().getTime();
		ajaxGet("json2.jsp"+dc+"&no=10101",function(rt){
			var jo = window.eval("("+rt+")");
			var html = "<table border='1' cellspacing='0' cellpadding='20'>";
			for( var i = 0 ; i < jo.data.length ; i++ ){
				html += "<tr>";
				html += "<td>" + jo.data[i].no + "</td>";
				html += "<td>" + jo.data[i].content + "</td>";
				html += "</tr>";
			}
			html += "</table>";
			
			e("dv").innerHTML = html;
		});
	};
	</script>
</head>
<body>
	<div id="dv"></div>
</body>
</html>