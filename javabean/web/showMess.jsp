<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/25
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="tom.MessBoard" %>
<jsp:useBean id="board" class="tom.MessBoard" scope="application"/>
<html>
<head>
    <title>showMess</title>
</head>
<body>
<jsp:getProperty name="board" property="allMessage"/>
<a href="inputMess.jsp">нрр╙аТят</a>
</body>
</html>
