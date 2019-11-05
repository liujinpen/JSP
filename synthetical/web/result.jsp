<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/9/29
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@page import="java.sql.*" %>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
  <head>
    <title>注册结果</title>
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
        text-align: center;
      background: url(images/zhuce_03.png) no-repeat;
      background-size: 100% 100%;
      width: 1200px;
      min-height: 700px;
      padding-bottom: 20px;
      overflow: hidden;
      margin: 40px;
    }
    .main .main-contents{
        text-align: center;
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

  <%
      String flag = new String(request.getParameter("flag").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
      String [] names=request.getParameterValues("name");
      String name0=new String(names[0].getBytes(StandardCharsets.ISO_8859_1),StandardCharsets.UTF_8);
  %>

  <%
      //进行数据库操作
      String email=names[3];//邮箱  登录时以邮箱为账号
      String pwd=names[1];//密码
      try{
          if(email.length()!=0&&pwd.length()!=0){
              Class.forName("com.mysql.jdbc.Driver");
              Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/useFORjava?"+
                      "user=root&password=1234&characterEncoding=GB2312");
              Statement sql=con.createStatement();
              String sql_s = "INSERT INTO user (email, pwd) VALUES ('" + email+"','"+pwd+"')";
              int rs = sql.executeUpdate(sql_s);
              if (rs>0)
              {}
              else{
                  response.sendRedirect("register.jsp");
                  System.out.println("注册失败");}
          }
      }catch(Exception e){
          response.sendRedirect("register.jsp");
          System.out.println("database insert erro!"+e);
      }

  %>
  <div class="header">
    <div class="header-left">
      <img src="images/wm-denglu_03.jpg" alt="111">
      <a href="javascript:void(0)">会员注册</a>
    </div>
    <div class="header-right">
				<span id="">
					"已是CCF会员？"
					<a href="login.jsp">立即登录</a>/
				</span>
    </div>
  </div>
  <div class="main">
      <div class="main-contents">
          <div class="title">
					<span>
						您的注册信息
					</span>
          </div>
          <div style="width: fit-content;padding-top: 20px;margin-left: auto;margin-right: auto">
              <table style="font-size: 35px">
                  <tr>
                      <td align="right">会员类型：</td>
                      <td><%= flag%></td>
                  </tr>
                  <tr>
                      <td align="right">姓名：</td>
                      <td><%= name0%></td>
                  </tr>
                  <tr>
                    <td align="right">您的密码：</td>
                    <td><%= names[1]%></td>
                  </tr>
                  <tr>
                      <td align="right">邮箱：</td>
                      <td><%= names[3]%></td>
                  </tr>
                  <tr>
                      <td align="right">电话：</td>
                      <td><%= names[4]%></td>
                  </tr>
              </table>
          </div>
      </div>
  </div>
  </body>
</html>
