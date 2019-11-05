<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/27
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="solve"%>
<html>
<head>
    <title>四则运算</title>
    <style>
        input{
            border-radius: 10px ;
            height: 100px;
            width: 200px;
            font-size: 50px;
            text-align: center;
        }
        select{
            border-radius: 10px;
            height: 100px;
            font-size: 40px;
            text-align: center;
        }
    </style>
</head>
<body style="background:burlywood">
<h2>输入运算数、选择运算符号：</h2>
<form action="" method="post" name="form">
    <input  type="text" name="first">
    <select  name="select">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="cheng">×</option>
        <option value="chu">÷</option>
    </select>
    <input type="text" name="second">
    <br>
    <input style="border-radius: 10px; height: 50px ;text-align: center ;font-size: 30px" type="submit" name="submit" value="提交你的选择">
</form>
<%
    String first=request.getParameter("first");
    if(first==null)
        first="0";
    String select=request.getParameter("select");
    if(select==null)
        select="+";
    String second=request.getParameter("second");
    if(second==null)
        second="0";
    if(first.length()>0&&second.length()>0){
%>
<solve:computer firstnumber="<%= first%>" secondnumber="<%=second%>" choose="<%=select%>"/>
<h3>计算结果是：<%= firstreturn%> <%= option%> <%= secondreturn%> <%= result%>
<%
    }
%>
</body>
</html>
