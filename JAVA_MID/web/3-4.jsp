<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/21
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="java.util.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="show"%>
<html>
<head>
    <title>3-4</title>
</head>
<body>
<%
    LinkedList listName=new LinkedList();
    LinkedList listScore=new LinkedList();
    listName.add("张三");listScore.add(87d);
    listName.add("李四");listScore.add(77d);
    listName.add("王五");listScore.add(97d);
    listName.add("赵六");listScore.add(57d);
%>
<p>成绩单：</p>
<show:Sort title="姓名" item="高等数学" listName="<%= listName%>" listScore="<%= listScore%>"/>
</body>
</html>
