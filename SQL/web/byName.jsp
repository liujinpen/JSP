<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/18
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="inquire"%>
<html>
<head>
    <title>byName</title>
</head>
<body style="background: lightpink">
<%
    String name=request.getParameter("name");
    if(name ==null){
        name="";
    }
    byte [] bb=name.getBytes("iso-8859-1");
    name=new String(bb);
%>
<inquire:NameConditon name="<%= name%>"/>
姓名含有“<%= name%>”的记录：<br>
<%= queryResultByName%>
</body>
</html>
