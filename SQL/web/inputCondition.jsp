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
      ����ѧ�Ų�ѯ<br>
      ����ѧ�ţ�<input type="text" name="number" size="3">
      <input type="submit" value="�ύ">
  </form>

  <form action="byName.jsp" method="post">
      ����������ģ������ѯ<br>
      �������У�<input type="text" name="name" size="3">
      <input type="submit" value="�ύ">
  </form>

  </body>
</html>
