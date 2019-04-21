package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.db.ConnectDb;
import com.db.CloseDb;
import com.model.UserBean;

/**
 * 
 * @ClassName:  LoginDao   
 * @Description:��װ�˹����û����ݿ�Ĳ��������ѯ�����룬�޸ģ����µ�  
 * @author: ��һ��
 * @date:   2019��3��25��   
 */

public class ManagerDao {
	public static Connection conn=null;
	public static PreparedStatement ps=null;
	public static ResultSet res=null;
	
	public static boolean AddUser(UserBean user){
		boolean flag=false;
		conn=ConnectDb.getConn();
		String sql="insert into tb_user(name,password,email) values(?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getEmail());
			int row=ps.executeUpdate();
			if(row>0) {
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			CloseDb.close(conn, ps);
		}
		return flag;
	}
	
	public static boolean UpdateUser(UserBean user) {
		boolean flag=false;
		conn=ConnectDb.getConn();
		String sql="update tb_user set password = ? where name = ?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getName());
			int row =ps.executeUpdate();
			if(row>0) {
				flag=true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDb.close(conn, ps);
		}
		return flag;
	}
	
	public static UserBean QueryById(int id) {
		UserBean ans=new UserBean();
		conn=ConnectDb.getConn();
		String sql="select * from tb_user where id=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			res=ps.executeQuery();
			while(res.next()) {
				ans.setId(id);
				ans.setName(res.getString("name"));
				ans.setPassword(res.getString("password"));
				ans.setEmail(res.getString("email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.allClose(conn, ps, res);
		}
		return ans;
	}
	
	public static UserBean QueryByName(String name) {
		UserBean ans=new UserBean();
		conn=ConnectDb.getConn();
		String sql="select * from tb_user where name=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			res=ps.executeQuery();
			while(res.next()) {
				ans.setId(res.getInt("id"));
				ans.setName(res.getString("name"));
				ans.setPassword(res.getString("password"));
				ans.setEmail(res.getString("email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.allClose(conn, ps, res);
		}
		return ans;
	}
	
	public static ArrayList<UserBean> QueryAll(){
		ArrayList<UserBean>ans =new ArrayList<UserBean>();
		conn=ConnectDb.getConn();
		String sql="select * from tb_user";
		try {
			ps=conn.prepareStatement(sql);
			res=ps.executeQuery();
			while(res.next()) {
				UserBean temp=new UserBean();
				temp.setId(res.getInt("id"));
				temp.setName(res.getString("name"));
				temp.setEmail(res.getString("email"));
				temp.setPassword(res.getString("password"));
				ans.add(temp);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.allClose(conn, ps, res);
		}
		return ans;
	}
	
	public static boolean DelId(int id) {
		boolean flag=false;
		conn=ConnectDb.getConn();
		String sql="delete from tb_user where id=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			int r=ps.executeUpdate();
			if(r>0) {
				flag=true;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.close(conn, ps);
		}
		return flag;
	}
}
