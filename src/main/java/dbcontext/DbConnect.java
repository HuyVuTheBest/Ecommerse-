package dbcontext;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect {
	public  Connection GetConnect() throws  SQLException {
		 String server = "LAPTOP-JFKMD0OF\\SQLEXPRESS";
	        String dbname = "SuperSneaker";
	        String username = "sa";
	        String password = "1234";
	        String url = "jdbc:sqlserver://" + server + ";databaseName=" + dbname + ";user= "+username+";password="+password+";"+";encrypt=true;trustServerCertificate=true";

	        Connection con = null;
	        
	        try {
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            con= DriverManager.getConnection(url);
	            return con;
	            
	            
	            } catch (ClassNotFoundException e) {
	            System.out.println("Không tìm thấy driver JDBC.");
	            throw new SQLException("Không tìm thấy driver JDBC.", e);
	        } catch (SQLException e) {
	            System.out.println("Kết nối thất bại. Lỗi: " + e.getMessage());
	            throw e;
	        }	        
	}
}
