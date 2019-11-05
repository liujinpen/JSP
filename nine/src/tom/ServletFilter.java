package tom;

import com.sun.deploy.net.HttpResponse;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ServletFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        LoginMessage message;
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        HttpSession session=request.getSession(true);
        try {
            message=(LoginMessage)session.getAttribute("loginBean");
            String name_origin=(String )session.getAttribute("name");

            if(message==null){
                message=new LoginMessage();
                session.setAttribute("loginBean",message);
                message=(LoginMessage)session.getAttribute("loginBean");
            }
            String name=message.getLogin_name();
            if(name.equals(name_origin)){
                message.setBackNews(name+"已经登录了");
                message.setLogin_name(name);
            }
            else{
                message.setBackNews(name_origin+"登录成功");
                message.setLogin_name(name_origin);
            }
            RequestDispatcher dispatcher=request.getRequestDispatcher("login_success.jsp");
            dispatcher.forward(request,response);
            return ;
        }
        catch (Exception e){
            System.out.println("doFilter:"+e);
        }
    }

    @Override
    public void destroy() {

    }
}
