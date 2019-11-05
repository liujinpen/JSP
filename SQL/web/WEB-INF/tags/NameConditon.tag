<%@ tag pageEncoding="GB2312" %>
<%@ tag import="java.sql.*" %>
<%@attribute name="name" required="true" %>
<%@variable name-given="queryResultByName"  scope="AT_END" %>
<%
    StringBuffer result=new StringBuffer();
    try{
        Class.forName("com.mysql.jdbc.Driver");
    }
    catch (Exception e){}
    Connection con;
    Statement sql;
    ResultSet rs;
    int n=0;
    try{
        result.append("<table border=1");
        String uri="jdbc:mysql://127.0.0.1/useFORjava?"+ "user=root&password=1234&characterEncoding=gb2312";
        con = DriverManager.getConnection(uri);
        DatabaseMetaData metaData=con.getMetaData();
        ResultSet rsl=metaData.getColumns(null,null,"people",null);
        int count=0;
        result.append("<tr>");
        while(rsl.next()) {
            count++;
            String clumName = rsl.getString(4);
            result.append("<td>" + clumName + "</td>");
        }
        result.append("</tr>");



        sql = con.createStatement();
        String condition="SELECT * FROM people WHERE name LIKE '%"+name+"%'";
        rs = sql.executeQuery(condition);
        while(rs.next()) {
            result.append("<tr>");
            for (int k = 1; k <= count; k++) {
                result.append("<td>" + rs.getString(k) + "</td>");
            }
            result.append("</tr>");
        }
        result.append("</table>");
        con.close();
    }
    catch (SQLException e){
        result.append(e);
    }
    jspContext.setAttribute("queryResultByName",result.toString());
%>