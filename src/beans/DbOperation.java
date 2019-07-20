package beans;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//实现数据库驱动器的加载
public class DbOperation{
	
	public Connection getConnection()
		throws ClassNotFoundException, SQLException{
		
		String sDBDriver = "com.mysql.jdbc.Driver";
		String conStr = "jdbc:mysql://localhost:3306/onlinehospital";
		String username = "root";
		String password = "ciemon";
    
		Class.forName(sDBDriver);
		Connection conn = DriverManager.getConnection(conStr,username,password);
		
		return conn;
	}
	
	public void update(Connection conn, String sql)throws SQLException{

		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		stmt.close();
	}
	
	
	
	public void close(Connection conn)throws SQLException{
		conn.close();
	}
}