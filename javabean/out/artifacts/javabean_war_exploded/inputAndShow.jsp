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
    �����ƺţ�<input type="text" name="number"><br>
    ����Ʒ�ƣ�<input type="text" name="brand"><br>
    �������ڣ�<input type="text" name="date">
    <input type="submit" value="�ύ">
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

���һ���ύ������Ϊ��<br>
<jsp:getProperty name="base" property="lastRecord"/>
<br>
<br>
Ŀǰ�ѵǼǳ�����<jsp:getProperty name="base" property="numRecord"/>����<br>
<jsp:getProperty name="base" property="queryResult"/>
</body>
</html>
