import java.sql.*;

public class test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=student_management;user=ljp;password=123";
        Connection con = DriverManager.getConnection(url);
        String SQL = "SELECT  * FROM S";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(SQL);
        while (rs.next()) {
            System.out.println(rs.getString(1) + " " + rs.getString(2)+ " " + rs.getString(3));
        }
        rs.close();
        con.close();
    }
}
