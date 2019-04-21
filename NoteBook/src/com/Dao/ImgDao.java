package com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.db.ConnectDb;
import com.db.CloseDb;
import com.model.UserBean;
import com.model.Img;

public class ImgDao {
	public static Connection conn=null;
	public static PreparedStatement ps=null;
	public static ResultSet res=null;
	
	public static boolean AddImage(Img image) {
		boolean flag=false;
		conn = ConnectDb.getConn();
		String sql="insert into tb_image(uid,path) values(?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, image.getUserid());
			ps.setString(2, image.getPath());
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
	
	public static ArrayList<Img> QueryByUserId(int id) {
		ArrayList<Img>images = new ArrayList<Img>();
		Img image=new Img();
		conn=ConnectDb.getConn();
		String sql="select * from tb_image where uid=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			res=ps.executeQuery();
			while(res.next()) {
				image.setId(res.getInt("id"));
				image.setUserid(res.getInt("uid"));
				image.setPath(res.getString("path"));
				images.add(image);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			CloseDb.allClose(conn, ps, res);
		}
		return images;
	}
}
