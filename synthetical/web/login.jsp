<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/29
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <title>登陆</title>
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
						会员登录
					</span>
        </div>

        <% String str=request.getParameter("flag");
            if (str!=null&&str.equals("fault")){
        %>
        <div style="color:red;text-align:center">
            账号或密码错误，请重新输入！
        </div>
        <%
            }
        %>

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
                            request.getRequestDispatcher("welcome.jsp").forward(request, response);
                        }
                    }
                }
            }
        %>


        <form id="form"  name="form2" method="post"  action="welcome.jsp" >
            <div class="register">
                <ul>
                    <li>
                        <span class="item" > 账号：</span>
                        <span class="hy-text">
									<input type="text" name="account" placeholder="邮箱号"  >
								</span>
                    </li>
                    <li>
                        <span class="item"> 密码：</span>
                        <span class="hy-text">
									<input type="password" name="pwd" placeholder="请输入密码" >
								</span>
                    </li>
                </ul>
            </div>

            <div class="register-button" >
                <input type="submit" name="register" id="btn1"  value="登录"/>
                是否保存登录状态
                <input type="radio" name="log" value="yes">是
                <input type="radio" name="log" value="no">否
            </div>
        </form>
    </div>
</div>
</body>
</html>
