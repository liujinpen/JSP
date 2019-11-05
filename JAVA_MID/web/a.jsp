<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/29
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<%
    char str =(char)(Math.random()*26+'a');
    session.setAttribute("save",str);

    out.print((Character) session.getAttribute("save"));

%>
</body>
</html>
