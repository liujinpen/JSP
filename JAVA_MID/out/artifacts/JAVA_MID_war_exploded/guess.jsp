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
    <title>猜</title>
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
当前的猜测结果：<%= message%>
<%
    if(((String) message).startsWith("你猜对了")){
%>      <br><a href="example4-18.jsp">重新获得随机字母</a>
<%
    }
    else{
%>
    <br>输入你的猜测：
    <form action="" method="post" name="form">
        <input type="text" name="guessCharacter">
        <input type="submit" value="送出" name="submit">
    </form>
<%
    }
%>
</body>
</html>
