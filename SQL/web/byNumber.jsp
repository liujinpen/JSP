<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/18
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="inquire"%>
<html>
<head>
    <title>byNumber</title>
</head>
<body style="background: lightseagreen">
<%
    String number=request.getParameter("number");
    if(number ==null){
        number="";
    }
%>
<inquire:NumberCondtion number="<%= number%>"/>
����ѧ��<%= number%>��ѯ���ļ�¼��<br>
<%= queryResultByNumber%>
</body>
</html>
