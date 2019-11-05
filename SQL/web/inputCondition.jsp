<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/18
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
  <head>
    <title>inputCondition</title>
  </head>
  <body>
  <form action="byNumber.jsp" method="post">
      根据学号查询<br>
      输入学号：<input type="text" name="number" size="3">
      <input type="submit" value="提交">
  </form>

  <form action="byName.jsp" method="post">
      根据姓名（模糊）查询<br>
      姓名含有：<input type="text" name="name" size="3">
      <input type="submit" value="提交">
  </form>

  </body>
</html>
