<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/11/3
  Time: 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>

<html>
<head>
    <title>register</title>
</head>
<body style="text-align: center">
<div style="text-align: center;width:fit-content; margin-left: auto; margin-right: auto">
    <h1>»¶Ó­·ÃÎÊ£¬ÇëµÇÂ¼</h1>
    <form action="handlelogin" method="post">
        ÕËºÅ<input style="height: 50px; border-radius: 10px; margin: 10px" type="text" name="login_name" value="123@qq.com"><br>
        ÃÜÂë<input style="height: 50px; border-radius: 10px; margin: 10px" type="password" name="login_password" value="123"><br>
        <br>
        <input style="height: 30px; border-radius: 5px; width: 100px; font-size: 20px" type="submit" value="µÇÂ¼"><br>
        <br>ÊÇ·ñ±£´æµÇÂ¼×´Ì¬<br>
        <input type="radio" value="yes" name="save">ÊÇ
        <input type="radio" value="no" name="save">·ñ
    </form>
</div>


</body>
</html>
