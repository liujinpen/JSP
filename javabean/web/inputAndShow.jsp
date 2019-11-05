<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/25
  Time: 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="tom.Car" %>
<jsp:useBean id="base" class="tom.Car" scope="request"/>
<jsp:setProperty name="base" property="databaseName" value="useforjava"/>
<jsp:setProperty name="base" property="tableName" value="cars"/>
<jsp:setProperty name="base" property="user" value="root"/>
<jsp:setProperty name="base" property="password" value="1234"/>
<html>
<head>
    <title>inputandshow</title>
</head>
<body>
<form action="" method="post">
    汽车牌号：<input type="text" name="number"><br>
    汽车品牌：<input type="text" name="brand"><br>
    生产日期：<input type="text" name="date">
    <input type="submit" value="提交">
</form>
<%
    String number=request.getParameter("number");
    if(number==null){
        number="";
    }
    String brand=request.getParameter("brand");
    if(brand==null){
        brand="";
    }
    String date=request.getParameter("date");
    if(date==null){
        date="";
    }
    if(number.length()>0&&brand.length()>0&&date.length()>0){
%>
        <jsp:setProperty name="base" property="number" value="<%= number%>"/>
        <jsp:setProperty name="base" property="brand" value="<%= brand%>"/>
        <jsp:setProperty name="base" property="date" value="<%= date%>"/>
<%
    }
%>

最后一个提交的数据为：<br>
<jsp:getProperty name="base" property="lastRecord"/>
<br>
<br>
目前已登记车辆共<jsp:getProperty name="base" property="numRecord"/>辆：<br>
<jsp:getProperty name="base" property="queryResult"/>
</body>
</html>
