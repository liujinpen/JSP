<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/21
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>come</title>
</head>
<body>
<%
    String string = request.getParameter("number");
    double n=Double.parseDouble(string);
%>
<p>����������Ϣ�ǣ�</p>
<br>
<%= n%>

</body>
</html>
