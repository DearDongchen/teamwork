package com.db;
import java.util.*;
import java.sql.*;
import java.io.*;

public class ConnectDb {
	public static Connection getConn() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/userdata?useUnicode=true&characterEncoding=utf-8&serverTimezone=GMT%2B8&useSSL=false";
			String username="root";
			String password="123456";
			//连接数据库
			conn=DriverManager.getConnection(url, username, password);
			if(conn!=null) {
				System.out.println("数据库连接成功!");
			}
			else {
				System.out.println("数据库连接失败!");
			}
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void main(String []args) {
		getConn();
	}
}
