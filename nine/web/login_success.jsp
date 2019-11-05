<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/11/3
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="tom.LoginMessage" %>
<jsp:useBean id="loginBean" class="tom.LoginMessage" scope="session"/>
<html>
<head>
    <title>success</title>
</head>
<body style="text-align: center">
<h1>µÇÂ¼·´À¡£º</h1>
<jsp:getProperty name="loginBean" property="login_name"/>
<br>
<jsp:getProperty name="loginBean" property="backNews"/>
</body>
</html>