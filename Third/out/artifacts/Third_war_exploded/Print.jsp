<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/22
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
  <head>
    <title>¥Ú”°¡‚–Œ</title>
  </head>
  <body style="text-align: left ">
  <div style="text-align: center ;width: fit-content ;background: chartreuse">
    <%
      for(int i=1;i<=8;i++){
        for (int j=1;j<=i;j++){
          out.print("* ");
        }
        out.println("<br>");
      }
      for(int i=7;i>=1;i--) {
        for (int j = 1; j <= i; j++) {
          out.print("* ");
        }
        out.println("<br>");
      }
    %>
  </div>
  </body>
</html>
