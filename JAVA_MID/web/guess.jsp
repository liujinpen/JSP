<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/11
  Time: 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="guessCharacter"%>
<html>
<head>
    <title>��</title>
</head>
<body>
<%
    String str=request.getParameter("guessCharacter");
    if(str==null)
        str = "*";
    if(str.length()==0)
        str = "*";
%>
<guessCharacter:GuessTag character="<%= str%>"/>
��ǰ�Ĳ²�����<%= message%>
<%
    if(((String) message).startsWith("��¶���")){
%>      <br><a href="example4-18.jsp">���»�������ĸ</a>
<%
    }
    else{
%>
    <br>������Ĳ²⣺
    <form action="" method="post" name="form">
        <input type="text" name="guessCharacter">
        <input type="submit" value="�ͳ�" name="submit">
    </form>
<%
    }
%>
</body>
</html>
