<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery-3.3.1.js"></c:url>"></script>
<title>Insert title here</title>

</head>
<body>
  ファイルがアップロードされました。<br>
    ファイル名 : ${savedName}
<script>
    var result = "${savedName}";
    parent.addFilePath(result); // 파일명을 부모페이지로 전달
</script>    
    
</body>
</html>