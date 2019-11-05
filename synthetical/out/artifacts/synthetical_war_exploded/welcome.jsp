<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/29
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>welcome</title>
    <style type="text/css"><!--type属性标注了当前内容的类型-->
    .header{
        width: 1200px;
        height: auto;
        margin: 40px;
        overflow: hidden;
    }
    .header .header-left{
        height: 65px;
        line-height: 65px;
        float: left;
    }
    .header .header-left img{
        float: left;
    }
    .header .header-left a{
        font-size: 24px;
        color: #888;
        padding-left: 10px;
        text-decoration: none;
    }
    .header .header-right{
        float: right;
        height: 55px;
        line-height: 80px;
    }
    .header .header-right span{
        background: url(images/wm-logo_03.jpg)0 1px no-repeat;
        padding-left: 23px;
    }
    .header .header-right a{
        text-decoration: none;
    }
    .main{
        background: url(images/zhuce_03.png) no-repeat;
        background-size: 100% 100%;
        width: 1200px;
        min-height: 700px;
        padding-bottom: 20px;
        overflow: hidden;
        margin: 40px;
    }
    .main .main-contents{
        width: 890px;
        min-height: 618px;
        margin: 0 150px;
        margin-top: 20px;
        padding-bottom: 30px;
        background: #fff;
        border-radius: 3px;
    }
    .main .main-contents .title{
        width: 890px;
        height: 60px;
        line-height: 60px;
        background: #1097f0;
        text-align: center;
    }
    .main .main-contents .title span{
        font-size: 22px;
        color: #fff;
        height: 77px;
    }
    .main .main-contents ul{
        list-style: none;
    }
    .main .main-contents ul li{
        line-height: 50px;
        padding-left: 150px;
    }
    .main .main-contents .register .item{
        width: 120px;
        font-size: 24px;
        color: #333;
        text-align: right;
        margin-right: 10px;
        display: inline-block;
    }
    .main .main-contents .register .hy-name{
        font-size: 24px;
        color: #333;
    }
    .main .main-contents .register .hy-text [type="text"]{
        font-size: 24px;
        color: #333;
        width: 280px;
        height: 33px;
        padding-left: 10px;
    }
    .main .main-contents .register .hy-text [type="password"]{
        font-size: 24px;
        color: #333;
        width: 280px;
        height: 33px;
        padding-left: 10px;
    }
    .main .main-contents .tl{
        height: 50px;
        line-height: 50px;
        padding-left: 320px;
        font-size: 24px;
    }
    .main .main-contents .register-button [type="submit"]{
        width: 160px;
        height: 50px;
        line-height: 50px;
        text-align: center;
        font-size: 24px;
        display: inline-block;
        margin-left: 400px;
    }
    </style>
</head>
<body>

<div class="header">
    <div class="header-left">
        <img src="images/wm-denglu_03.jpg" alt="111">
        <a href="javascript:void(0)">会员注册</a>
    </div>
    <div class="header-right">
				<span id="">
					"已是CCF会员？"
					<a href="login.jsp">立即登录</a>
				</span>
    </div>
</div>

<div class="main">
    <div class="main-contents">
        <div class="title">
					<span>
						登录成功！
					</span>
        </div>
        <%
            Integer f=(Integer)request.getAttribute("havecookies");
            String log="";
            log=request.getParameter("log");
            if(f!=null){//f不为空  说明cookies有记录
                String account="";
                String pwd="";
                Cookie[] cookies=request.getCookies();
                if(cookies!=null&&cookies.length>0)
                {
                    for(Cookie c:cookies){
                        if(c.getName().equals("account")){
                            account=c.getValue();
                        }
                        if(c.getName().equals("pwd")){
                            pwd=c.getValue();
                        }
                    }


                    if(account.equals("admin@xaut.edu.cn")&&pwd.equals("123456")){
                        out.println("<div style=\"text-align: center\">"+account+"欢迎您！</div>");
                    }
                    else response.sendRedirect("login.jsp?flag=fault");
                }
            }
            else{//cookies里面没有记录  需要新加入记录
                if(log!=null&&log.equals("yes")){//选择了记住密码
                    String account=request.getParameter("account").trim();
                    String pwd=request.getParameter("pwd").trim();

                    //进行数据库操作
                    try{
                        if(account.length()!=0&&pwd.length()!=0){
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/useFORjava?"+
                                    "user=root&password=1234&characterEncoding=GB2312");
                            Statement sql=con.createStatement();
                            String sql_s="SELECT * FROM user WHERE email='"+account+"' AND pwd ='"+pwd+"'";
                            System.out.println(sql_s);
                            ResultSet rs=sql.executeQuery(sql_s);
                            if (rs.next()){
                                Cookie cookie1=new Cookie("account",account);
                                Cookie cookie2=new Cookie("pwd",pwd);
                                cookie1.setMaxAge(30);
                                cookie2.setMaxAge(30);
                                response.addCookie(cookie1);
                                response.addCookie(cookie2);
                                out.println("<div style=\"text-align: center\">"+account+"欢迎您！</div>");
                            }
                            else{//数据库没有对应的账号
                                Cookie cookies[]=request.getCookies();
                                for(int i=0;i<cookies.length;i++) {
                                    cookies[i].setMaxAge(0);
                                    response.addCookie(cookies[i]);
                                }
                                response.sendRedirect("login.jsp?flag=fault");
                            }
                        }
                        else{//登录界面没有输入账号
                            response.sendRedirect("login.jsp?flag=fault");
                        }
                    }
                    catch (Exception e){
                        response.sendRedirect("login.jsp?flag=fault");
                        System.out.println("database inser error!"+e);
                    }
//                    if(account!=null&& pwd!=null&& account.equals("admin@xaut.edu.cn")&& pwd.equals("123456")){//密码正确  记录进cookies
//                        Cookie cookie1=new Cookie("account",account);
//                        Cookie cookie2=new Cookie("pwd",pwd);
//                        cookie1.setMaxAge(30);
//                        cookie2.setMaxAge(30);
//                        response.addCookie(cookie1);
//                        response.addCookie(cookie2);
//                        out.println("<div style=\"text-align: center\">"+account+"欢迎您！</div>");
//                    }
//                    else{//密码错了  不记录cookies
//                        Cookie cookies[]=request.getCookies();
//                        for(int i=0;i<cookies.length;i++) {
//                            cookies[i].setMaxAge(0);
//                            response.addCookie(cookies[i]);
//                        }
//                        response.sendRedirect("login.jsp?flag=fault");
//                    }
                }
                else{//不记住密码
                    String account=request.getParameter("account").trim();
                    String pwd=request.getParameter("pwd").trim();
                    try{
                        if(account.length()!=0&&pwd.length()!=0){
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/useFORjava?"+
                                    "user=root&password=1234&characterEncoding=GB2312");
                            Statement sql=con.createStatement();
                            String sql_s="SELECT * FROM user WHERE email='"+account+"' AND pwd ='"+pwd+"'";
                            System.out.println(sql_s);
                            ResultSet rs=sql.executeQuery(sql_s);
                            if (rs.next()){
                                out.println("<div style=\"text-align: center\">"+account+"欢迎您！</div>");
                            }
                            else{//数据库没有对应的账号
                                response.sendRedirect("login.jsp?flag=fault");
                            }
                        }
                        else{//登录界面没有输入账号
                            response.sendRedirect("login.jsp?flag=fault");
                        }
                    }
                    catch (Exception e){
                        response.sendRedirect("login.jsp?flag=fault");
                        System.out.println("database inser error!"+e);
                    }
                }
            }
        %>
    </div>
</div>
</body>
</html>
