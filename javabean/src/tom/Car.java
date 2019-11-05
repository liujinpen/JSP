package tom;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.sql.*;
public class Car {
    String databaseName="";
    String tableName="";
    String user="";
    String password="";
    StringBuffer queryResult;
    StringBuffer  lastRecord;
    StringBuffer  numRecord;
    String number;
    String brand;
    String date;

    public Car(){
        number= "";
        brand= "";
        date= "";
        queryResult=new StringBuffer();
        lastRecord=new StringBuffer();//返回最后一个车辆信息
        numRecord=new StringBuffer();//返回车辆个数
        try {
            Class.forName("com.mysql.jdbc.Driver");
        }
        catch (Exception e){
            System.out.println("car error"+e);
        }
    }
    public String getDatabaseName() {
        return databaseName;
    }
    public void setDatabaseName(String databaseName) {
        this.databaseName = databaseName.trim();
    }

    public String getUser() {
        return user;
    }
    public void setUser(String user) {
        this.user = user.trim();
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password.trim();
    }

    public String getTableName() {
        return tableName;
    }
    public void setTableName(String tableName) {
        this.tableName = tableName.trim();
    }

    public void setNumber(String number) throws UnsupportedEncodingException {
        byte []bb=number.getBytes("iso-8859-1");
        this.number = new String(bb);
    }

    public void setBrand(String brand) throws UnsupportedEncodingException {
        byte []bb=brand.getBytes("iso-8859-1");
        this.brand=new String(bb);
    }

    public void setDate(String date) throws UnsupportedEncodingException {
        byte []bb=date.getBytes("iso-8859-1");
        this.date = new String(bb);
        Connection connection;
        Statement sql;
        try {
            String uri="jdbc:mysql://127.0.0.1/"+databaseName+"?useUnicode=true&characterEncoding=gb2312";
            connection =DriverManager.getConnection(uri,user,password);
            sql = connection.createStatement();
            String condition="INSERT INTO cars (车牌号,品牌,生产日期) VALUES ('" + this.number+"','"+this.brand+"','"+this.date+"')";
            int rs = sql.executeUpdate(condition);
            if(rs>0) {
            }
            connection.close();
        }
        catch (SQLException e){
            System.out.println("date error:"+e);
        }
    }

    public StringBuffer getLastRecord() {
        Connection connection;
        Statement sql;
        ResultSet rs;
        try {
            String uri="jdbc:mysql://127.0.0.1/"+databaseName+"?useUnicode=true&characterEncoding=gb2312";
            connection =DriverManager.getConnection(uri,user,password);
            DatabaseMetaData metaData=connection.getMetaData();
            ResultSet rsl=metaData.getColumns(null,null,tableName,null);

            sql = connection.createStatement();
            String condition="SELECT * FROM cars ORDER BY 序号 DESC LIMIT 1";
            rs = sql.executeQuery(condition);
            if(rs.next()) {
                int k=2;
                rsl.next();
                while(rsl.next()){
                    lastRecord.append(rsl.getString(4)+":");
                    lastRecord.append(" "+rs.getString(k)+" ");
                    k++;
                }
            }
            connection.close();
        }
        catch (SQLException e){
            System.out.println("lastrecord error:"+e);
        }
        return lastRecord;
    }

    public StringBuffer getNumRecord() {
        Connection connection;
        Statement sql;
        ResultSet rs;
        try {
            String uri="jdbc:mysql://127.0.0.1/"+databaseName+"?useUnicode=true&characterEncoding=gb2312";
            connection =DriverManager.getConnection(uri,user,password);
            sql = connection.createStatement();
            String condition="SELECT * FROM cars ORDER BY 序号 DESC  LIMIT 1";
            rs = sql.executeQuery(condition);
            if(rs.next()) {
                numRecord.append(rs.getString(1));
            }
            else{
                numRecord.append("0");
            }
            connection.close();
        }
        catch (SQLException e){
            System.out.println("numrecord error:"+e);
        }
        return numRecord;
    }

    public StringBuffer getQueryResult() {
        Connection connection;
        Statement sql;
        ResultSet rs;
        try {
            queryResult.append("<table border=1>");
            String uri="jdbc:mysql://127.0.0.1/"+databaseName+"?useUnicode=true&characterEncoding=gb2312";
            connection =DriverManager.getConnection(uri,user,password);
            DatabaseMetaData metaData=connection.getMetaData();
            ResultSet rsl=metaData.getColumns(null,null,tableName,null);
            int count=0;

            sql = connection.createStatement();
            String condition="SELECT * FROM cars";
            rs = sql.executeQuery(condition);
            if(rs.next()){
                queryResult.append("<tr>");
                while(rsl.next()) {
                    count++;
                    String clumName = rsl.getString(4);
                    queryResult.append("<td>" + clumName + "</td>");
                }
                queryResult.append("</tr>");

                queryResult.append("<tr>");
                for (int k = 1; k <= count; k++) {
                    queryResult.append("<td>" + rs.getString(k) + "</td>");
                }
                queryResult.append("</tr>");

                while(rs.next()) {
                    queryResult.append("<tr>");
                    for (int k = 1; k <= count; k++) {
                        queryResult.append("<td>" + rs.getString(k) + "</td>");
                    }
                    queryResult.append("</tr>");
                }
            }
            queryResult.append("</table>");
            connection.close();
        }
        catch (SQLException e){
            queryResult.append("请输入正确的用户名和密码");
            System.out.println("queryresult error:"+e);
        }
        return queryResult;
    }
}
