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
			//�������ݿ�
			conn=DriverManager.getConnection(url, username, password);
			if(conn!=null) {
				System.out.println("���ݿ����ӳɹ�!");
			}
			else {
				System.out.println("���ݿ�����ʧ��!");
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
