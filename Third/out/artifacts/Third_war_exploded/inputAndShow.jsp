<%@ page import="sun.text.ComposedCharIter" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/22
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="computer"%>
<html>
输入三角形的三条边：
<head>
    <title>三角形面积</title>
</head>
<body>
<form action="" method="get" name="form">
    <table>
        <tr>
            <td>输入a：</td>
            <td><input type="text" name="a"></td>
        </tr>
        <tr>
            <td>输入b：</td>
            <td><input type="text" name="b"></td>
        </tr>
        <tr>
            <td>输入c：</td>
            <td><input type="text" name="c"></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="提交" name="submit">
</form>
<%
    String a=request.getParameter("a");
    String b=request.getParameter("b");
    String c=request.getParameter("c");
    if (a ==null||b ==null||c ==null){
        a = "0";
        b = "0";
        c = "0";
    }
%>
<computer:GetArea NumberA="<%=a%>" numberB="<%=b%>" numberC="<%=c%>"/>
<br><%= message%>
<br><%= area%>
</body>
</html>
