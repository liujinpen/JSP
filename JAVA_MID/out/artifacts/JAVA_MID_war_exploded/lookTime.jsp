<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/21
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="java.text.*" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="showTime"%>
<html>
<head>
    <title>lookTime</title>
</head>
<body>
    <showTime:GiveTag/>
    <%
        String a="0";
    %>
<h3>当前时间：</h3>
    <%= time%> <%=a%>

</body>
</html>
