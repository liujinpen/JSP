<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<HTML><BODY bgcolor=cyan>
<% Connection con;
    Statement sql;
    ResultSet rs;
    try{  Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){}
    try { String uri= "jdbc:mysql://127.0.0.1/useFORjava";
        String user="root";
        String password="1234";
        con=DriverManager.getConnection(uri,user,password);
        //也可以写成con=DriverManager.getConnection(uri+"?user=root&password=");
        sql=con.createStatement();
        rs=sql.executeQuery("SELECT * FROM people WHERE number LIKE '%1'" );
        out.print("<table border=2>");
        out.print("<tr>");
        out.print("<th width=100>"+"学号");
        out.print("<th width=100>"+"姓名");
        out.print("<th width=50>"+"生日");
        out.print("<th width=50>"+"邮箱");
        out.print("</TR>");
        while(rs.next()){
            out.print("<tr>");
            out.print("<td >"+rs.getString(1)+"</td>");
            out.print("<td >"+rs.getString(2)+"</td>");
            out.print("<td >"+rs.getDate("birthday")+"</td>");
            out.print("<td >"+rs.getString("email")+"</td>");
            out.print("</tr>") ;
        }
        out.print("</table>");
        con.close();
    }
    catch(SQLException e){
        out.print(e);
    }
%>
</BODY></HTML>
