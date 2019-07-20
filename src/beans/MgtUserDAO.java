package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class MgtUserDAO {
	public List<User> allUser(){//获取所有用户
		List<User> userList=new ArrayList<User>();
		User temp=null;
		String sql = "select * from user";
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				if(!(rs.getString("username").equals("admin"))){
					temp=new User(rs.getInt("id"),rs.getString("username"), rs.getString("occupation"));
					userList.add(temp);
				}
			}
			db.close(con);
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return userList;
	}
	
	
	public User queryUser(String id){//查询要修改用户
		User temp=null;
		String sql="select * from user where id="+id;
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				temp=new User(rs.getString("username"), rs.getString("password"), rs.getString("occupation"));
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
	
	public boolean deleteUser(int id){//删除用户
		String sql;
		boolean result=false;
		sql = "delete from user where id="+id;
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			db.update(con, sql);
			result=true;
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
	public boolean modiUser(String username,String password,String occupation){//修改用户
		String sql;
		boolean result=false;
		sql = "update user set password='"+password
				+ "',occupation='"+occupation
				+ "' where username='"+username
				+ "'";
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			db.update(con, sql);
			result=true;
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
	
	
	public boolean addUser(String username,String password,String occupation){//添加用户
		String sql;
		boolean result=false;
		sql = "insert into user values(null,'"
				+ username
				+ "','"
				+ password
				+ "','"
				+ occupation
				+ "')";
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			db.update(con, sql);
			result=true;
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
	
	public int getCount(){//获取总用户数
		int recordCount=0;
		String sql="select count(*) from user";
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				recordCount=rs.getInt(1);
			}
			db.close(con);
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return recordCount;
	}
	
	public List<User> getUserByST(int start,int count){//查询第start+1~start+count之间的的用户
		
		List<User> userList=new ArrayList<User>();
		User temp=null;
		String sql = "select * from user limit ?,?";
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
					temp=new User(rs.getInt("id"),rs.getString("username"), rs.getString("occupation"));
					userList.add(temp);
			}
			db.close(con);
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return userList;
		
	}
}










