<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body onload="javascript:goMain()">

</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function goMain(){
		location.href = "${pageContext.request.contextPath}/page/MainPage.pg";
	}
</script>
</html>

