<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/10/12
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>��ӭҳ��</title>
</head>
<body>
<%
    Integer f=(Integer)request.getAttribute("havecookies");
    String log="";
    log=request.getParameter("log");
    if(f!=null){//f��Ϊ��  ˵��cookies�м�¼
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


            if(account.equals("xaut")&&pwd.equals("123")){
                out.println("<div style=\"text-align: center;color: red\">Welcome:"+account+"</div>");
            }
            else response.sendRedirect("login2.jsp");
        }
    }
    else{//cookies����û�м�¼  ��Ҫ�¼����¼
        if(log!=null&&log.equals("yes")){//ѡ���˼�ס����
            String account=request.getParameter("account");
            String pwd=request.getParameter("pwd");
            if(account!=null&& pwd!=null&& account.equals("xaut")&& pwd.equals("123")){//������ȷ  ��¼��cookies
                Cookie cookie1=new Cookie("account",account);
                Cookie cookie2=new Cookie("pwd",pwd);
                cookie1.setMaxAge(30);
                cookie2.setMaxAge(30);
                response.addCookie(cookie1);
                response.addCookie(cookie2);
            }
            else{//�������  ����¼cookies
                Cookie cookies[]=request.getCookies();
                for(int i=0;i<cookies.length;i++) {
                    cookies[i].setMaxAge(0);
                    response.addCookie(cookies[i]);
                }
                response.sendRedirect("login2.jsp");
        }
        }
        else{//����ס����
            String account=request.getParameter("account");
            out.println("<div style=\"text-align: center;color: red\">Welcome:"+account+"</div>");
        }
    }
%>
��¼�ɹ���
</body>
</html>