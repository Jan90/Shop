package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection{
	private static Connection connection = null;

    public static Connection getConnection() {
            if (connection != null)
                    return connection;
            else { 

    try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306";
		String name = "user_first";
		String password = "12345t";
		connection = DriverManager.getConnection(url, name, password);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
     } catch (SQLException e) {
    	 e.printStackTrace();}
			return connection;
            }
    }	
}
