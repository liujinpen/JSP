<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/27
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312"%>
<html>
<head>
    <title>result</title>
</head>
<body>
<%
    String s=request.getParameter("number");
    try {
        double a=Double.parseDouble(s);
        if(a<0)
        {
            response.setContentType("text/html;charset=GB2312");
            out.print(a+"的平方："+(a*a));
        }
        else if(a<100)
        {
            response.setContentType("application/msword;charset=GB2312");
            out.print(a+"的立方："+(a*a*a));
        }
        else
        {
            response.sendError(404);
        }
    }
    catch (Exception e)
    {
        response.sendRedirect("input.jsp");
    }


%>
</body>
</html>
