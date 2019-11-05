package tom;

import tom.LoginMessage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.ws.Response;


@WebServlet(name = "LoginServlet",urlPatterns="/handlelogin",initParams= {
        @WebInitParam(name="database_name",value="useForjava"),
        @WebInitParam(name="table_name",value="user"),
        @WebInitParam(name="user_name",value="root"),
        @WebInitParam(name="password",value="1234"),
},
        loadOnStartup=1
)
public class LoginServlet extends HttpServlet{
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){}
    }
    public String handleString(String s){
        try {
            byte bb[]=s.getBytes("iso-8859-1");
            s=new String(bb);
        }
        catch (Exception ee){}
        return s;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection connection;
        Statement statement;
        //数据库的参数
        String user_name=getInitParameter("user_name").trim();
        String database_name=getInitParameter("database_name").trim();
        String password=getInitParameter("password").trim();
        String table_name=getInitParameter("table_name").trim();
        //表单参数
        String login_name=req.getParameter("login_name").trim();
        String login_password=req.getParameter("login_password").trim();
        login_name=handleString(login_name);
        login_password=handleString(login_password);
        //链接数据库
        String uri="jdbc:mysql://127.0.0.1/"+database_name+"?user="+user_name+"&password="+password+"&characterEncoding=GB2312";
        boolean boo=(login_name.length()>0&&login_password.length()>0);
        try {
            connection=DriverManager.getConnection(uri);
            String condition="SELECT * FROM "+table_name+" WHERE email= '"+login_name+"' and pwd='"+login_password+"'";
            statement=connection.createStatement();
            if(boo){
                ResultSet resultSet=statement.executeQuery(condition);
                if(resultSet.next()){

                    LoginMessage message=new LoginMessage();
                    req.setAttribute("loginBean", message);
                    message.setBackNews("登录成功");
                    message.setLogin_name(login_name);

                    HttpSession session=req.getSession(true);
                    session.setAttribute("name",login_name);

                    resp.sendRedirect("login_success.jsp");

                }
                else{
                    //登录失败
                    String backNews="登录失败，请检查用户名和密码";
                    fail(req,resp,login_name,backNews);
                }
            }
            else{
                //用户名或密码为空
                String backNews="请输入用户名和密码";
                fail(req,resp,login_name,backNews);
            }
            connection.close();
        }
        catch (SQLException exp){
            String backNews=""+exp;
            fail(req,resp,login_name,backNews);
            System.out.println("doPost:"+exp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
    private void fail(HttpServletRequest req, HttpServletResponse resp, String login_name, String backNews) {
        resp.setContentType("text/html;charset=GB2312");
        try {
            PrintWriter out=resp.getWriter();
            out.println("<html><body style=\"text-align: center\">");
            out.println("<h1>登录反馈：</h1>");
            out.println(login_name);
            out.println("<br>");
            out.println(backNews);
            out.println("<br><a href=login.jsp>返回登录</a>");
            out.println("</body></html>");
        }
        catch (IOException exp){
            System.out.println("fail:"+exp);
        }
    }
}