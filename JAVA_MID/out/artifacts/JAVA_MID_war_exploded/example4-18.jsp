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
    <title>����ĸ</title>
</head>
<body>
����ָ�����һ��Сд��ĸ����£�
<%
    char str =(char)(Math.random()*26+'a');
    session.setAttribute("count", 0);
    session.setAttribute("save",str);
%>
<br><a href="guess.jsp">ȥ�������ĸ</a>
</body>
</html>
