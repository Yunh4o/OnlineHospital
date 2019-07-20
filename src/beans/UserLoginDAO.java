package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserLoginDAO {//判断用户名是否存在
	public boolean checkName(String username){
		boolean result=false;
		String sql;

		sql = "select * from user where username=?";
				
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				result=true;
			}
			db.close(con);
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return result;
	}
	
	public String checkPass(String username,String occupation) {//前台登录校验
		String sql;
		String temp=null;
		sql = "select password from user where username=? and occupation=?";
				
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, occupation);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				temp=rs.getString("password");
			}
			db.close(con);
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return temp;
	}
}
