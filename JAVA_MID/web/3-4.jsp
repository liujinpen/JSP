<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/21
  Time: 19:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@page import="java.util.*" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="show"%>
<html>
<head>
    <title>3-4</title>
</head>
<body>
<%
    LinkedList listName=new LinkedList();
    LinkedList listScore=new LinkedList();
    listName.add("����");listScore.add(87d);
    listName.add("����");listScore.add(77d);
    listName.add("����");listScore.add(97d);
    listName.add("����");listScore.add(57d);
%>
<p>�ɼ�����</p>
<show:Sort title="����" item="�ߵ���ѧ" listName="<%= listName%>" listScore="<%= listScore%>"/>
</body>
</html>
