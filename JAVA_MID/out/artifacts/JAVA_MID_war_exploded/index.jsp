<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/20
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
  <head>
    <title>��2-7</title>
  </head>
  <body>
  <p>�����������ε�������a,b,c �ĳ��ȣ�</p>
  <form action="index.jsp" method="post name=form">
    <p>����a��</p> <input type="text" name="a">
    <p>����b��</p> <input type="text" name="b">
    <p>����c��</p> <input type="text" name="c">
    <input type="submit" value="�ͳ�" name="submit">
  </form>

  <%  String string_a=request.getParameter("a"),
          string_b=request.getParameter("b"),
          string_c=request.getParameter("c");
      double a=0,b=0,c=0;
  %>

  <%  if(string_a ==null){
        string_a ="0";
        string_b="0";
        string_c ="0";
      }
  %>

  <%
    try {
      a=Double.valueOf(string_a ).doubleValue();
      b=Double.valueOf(string_b ).doubleValue();
      c=Double.valueOf(string_c ).doubleValue();
      if (a+b>c&&a+c>b&&b+c>a){
        double p=(a+b+c)/2;
        double mianji=Math.sqrt(p*(p-a)*(p-b)*(p-c));
        out.print("<br>"+"�����������"+mianji);
      }
      else
        out.print("<br>"+"����Ĳ���������");
    }
    catch (NumberFormatException e){
      out.print("<br>"+"����������");
    }
  %>
  </body>
</html>
