package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class MgtPatientDAO {

	public int getCount(){//获取总病人数
		int recordCount=0;
		String sql="select count(*) from patient";
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
	
	public List<Patient> getPatientByST(int start,int count){//查询第start+1~start+count之间的的病人
		
		List<Patient> patientList=new ArrayList<Patient>();
		Patient temp=null;
		String sql = "select * from patient limit ?,?";
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
					temp=new Patient(rs.getInt("id"),rs.getString("casenum"), rs.getString("pname"), rs.getString("psex"), rs.getString("page"), rs.getString("recipenum"));
					patientList.add(temp);
			}
			db.close(con);
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return patientList;
		
	}
	
	public boolean deletePatient(int id){//删除病人
		String sql;
		boolean result=false;
		sql = "delete from patient where id="+id;
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
	
	public boolean modiPatient(String name,String sex,String age,int id){//修改病人信息
		String sql;
		boolean result=false;
		sql = "update patient set pname='"+name
				+ "',psex='"+sex
				+"',page="+age
				+ " where id="+id;
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
	
	public Patient queryPatient(String id){//查询要修改病人
		 Patient temp=null;
		String sql="select * from patient where id="+id;
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()) {
				temp=new Patient(rs.getInt("id"), rs.getString("pname"), rs.getString("psex"), rs.getString("page"));
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
	public boolean checkCaseNum(String casenum){
		boolean result=false;
		String sql;

		sql = "select * from patient where casenum=?";
				
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, casenum);
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
	
	public boolean addPatient(String casenum,String pname,String psex,String page){//添加用户
		String sql;
		boolean result=false;
		sql = "insert into patient(casenum,pname,psex,page) values('"
				+ casenum
				+ "','"
				+ pname
				+ "','"
				+ psex
				+"','"
				+page
				+ "')";
		System.out.println(sql);
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
	
	public boolean modiSelf(String pas,String user){//修改个人信息
		String sql;
		boolean result=false;
		sql = "update user set password='"+pas
				+ "' where username='"+user+"'";
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
	
	public boolean addMedical(String recipeNum,String caseReason,String recipeInfo,String delDoc){//添加处方
		String sql;
		boolean result=false;
		sql = "insert into recipe values('"
				+ recipeNum
				+ "','"
				+ caseReason
				+ "','"
				+ recipeInfo
				+"','"
				+delDoc
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
	
	public boolean updateMecical(String id,String recipenum){//更新patient表中的处方编号
		String sql;
		boolean result=false;
		sql = "update patient set recipenum='"+recipenum
				+"' where id="+id;
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
	
	public Recipe queryRecipe(String recipenum){//查询要修改病人
		Recipe temp=null;
		String sql="select * from recipe where recipenum="+recipenum;
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				temp=new Recipe(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		}catch(ClassNotFoundException e){
			System.out.println("数据库驱动程序不存在！");
			e.printStackTrace();
		}catch(SQLException e){
			System.out.println("数据库操作错误！");
			e.printStackTrace();
		}
		return temp;
	}
	
	public boolean checkRecipeNum(String recipenum){
		boolean result=false;
		String sql;

		sql = "select * from recipe where recipenum=?";
				
		DbOperation db = new DbOperation();
		try{
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, recipenum);
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
}
