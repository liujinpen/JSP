<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/11
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>猜字母</title>
</head>
<body>
随机分给了你一个小写字母，请猜！
<%
    char str =(char)(Math.random()*26+'a');
    session.setAttribute("count", 0);
    session.setAttribute("save",str);
%>
<br><a href="guess.jsp">去猜这个字母</a>
</body>
</html>
