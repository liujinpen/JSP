<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/12
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>µÇÂ¼</title>

</head>
<body>
<%
    String account=request.getParameter("account");
    String pwd=request.getParameter("pwd");
    if(account ==null||pwd==null) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("account")) {
                    account = c.getValue();
                }
                if (c.getName().equals("pwd")) {
                    pwd = c.getValue();
                }
                if (c.getName().equals("account")) {
                    request.setAttribute("havecookies", 1);
                    request.getRequestDispatcher("logok.jsp").forward(request, response);
                }
            }
        }
    }
%>
<%--<%--%>
<%--    String account="";--%>
<%--    String pwd="";--%>
<%--    Cookie[] cookies=request.getCookies();--%>
<%--    if(cookies!=null&&cookies.length>0)--%>
<%--    {--%>
<%--        for(Cookie c:cookies){--%>
<%--            if(c.getName().equals("account")){--%>
<%--                account=c.getValue();--%>
<%--            }--%>
<%--            if(c.getName().equals("pwd")){--%>
<%--                pwd=c.getValue();--%>
<%--            }--%>
<%--        }--%>

<%--        if(c.){--%>
<%--            request.getRequestDispatcher("login2.jsp").forward(request, response);--%>
<%--        }--%>
<%--        else{--%>
<%--            request.setAttribute("flag", 1);--%>
<%--            request.getRequestDispatcher("logok.jsp").forward(request, response);--%>
<%--        }--%>
<%--    }--%>
<%--%>--%>

<form name="logmes" action="logok.jsp" method="post">
    ÕËºÅ<input type="text" name="account" value=""><br>
    ÃÜÂë<input type="password" name="pwd" value=""><br>
    <input type="submit" value="µÇÂ¼">
    ÊÇ·ñ±£´æµÇÂ¼×´Ì¬<input name="log" type="radio" value="yes">ÊÇ
    <input name="log" type="radio" value="no">·ñ

</form>
</body>
</html>