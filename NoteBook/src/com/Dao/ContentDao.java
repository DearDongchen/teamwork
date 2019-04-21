package com.Dao;

import com.model.Content;
import com.db.CloseDb;
import com.db.ConnectDb;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ContentDao {
	static Connection conn=null;
	static PreparedStatement ps=null;
	static ResultSet res=null;
	
	public static boolean AddContent(Content content) {
		boolean flag=false;
		conn=ConnectDb.getConn();
		String sql="insert into tb_article(name,title,content,Degree) values(?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, content.getName());
			ps.setString(2, content.getTitle());
			ps.setString(3, content.getContent());
			ps.setString(4, content.getDegree());
			int r=ps.executeUpdate();
			if(r>0) {
				flag=true;
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally{
			CloseDb.close(conn, ps);
		}
		return flag;
	}
	
	public static Content QueryByID(int id){
		conn=ConnectDb.getConn();
		Content temp=new Content();
		String sql="select * from tb_article where cid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			res=ps.executeQuery();
			while(res.next()) {
				temp.setId(res.getInt("cid"));
				temp.setName(res.getString("name"));
				temp.setTitle(res.getString("title"));
				temp.setContent(res.getString("Content"));
				temp.setSendTime(res.getString("send_time"));
				temp.setDegree(res.getString("Degree"));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.allClose(conn, ps, res);
		}
		return temp;
	}
	
	public static boolean DelId(int id) {
		boolean flag=false;
		conn=ConnectDb.getConn();
		String sql="delete from tb_article where cid=?";
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
	
	public static boolean DelName(String name) {
		boolean flag=false;
		conn=ConnectDb.getConn();
		String sql="delete from tb_article where name=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, String.valueOf(name));
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
	
	public static ArrayList<Content> QueryByName(String name){
		ArrayList<Content> List=new ArrayList<Content>();
		conn=ConnectDb.getConn();
		String sql="select * from tb_article where name=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			res=ps.executeQuery();
			while(res.next()) {
				Content temp=new Content();
				temp.setId(res.getInt("cid"));
				temp.setName(res.getString("name"));
				temp.setTitle(res.getString("title"));
				temp.setContent(res.getString("Content"));
				temp.setSendTime(res.getString("send_time"));
				temp.setDegree(res.getString("Degree"));
				List.add(temp);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.allClose(conn, ps, res);
		}
		return List;
	}
}
