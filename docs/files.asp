<!DOCTYPE html>
<html>
<head>
<title>Available information</title>


</head>
<body>
<h1>Available information</h1>


<%@ Language="JScript" %>
<!--#include file="httprequest.asp"-->
<%

var url = "https://aqua.kingcounty.gov/aqua-al/documents/";
var data = "q=*."; // Notice you will need to url encode your values, simply pass them in as a name/value string

Response.Write( HttpRequest( url, data, "GET" ) );

%>
</body>
</html>