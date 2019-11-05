<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/21
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>2-13</title>
</head>
<body>
<%
    double i=Math.random();
%>
<jsp:forward page="come.jsp">
    <jsp:param name="number" value="<%= i%>"/>
</jsp:forward>

</body>
</html>
