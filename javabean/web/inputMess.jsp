<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/25
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="tom.MessBoard" %>
<jsp:useBean id="board" class="tom.MessBoard" scope="application"/>
<html>
<head>
    <title>inputMess</title>
</head>
<body>
<form action="" method="post">
    ����������֣�<br>
    <input type="text" name="name"><br>
    ����������Ա��⣺<br>
    <input type="text" name="title"/><br>
    �����������:<br>
    <textarea name="content" rows="10" cols="36" wrap="soft"></textarea><br>
    <input type="submit" value="�ύ��Ϣ">
</form>
<jsp:setProperty name="board" property="*"/>
<a href="showMess.jsp">�鿴���԰�</a>
</body>
</html>
