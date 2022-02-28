package kr.co.farmstory3.db;

import java.sql.Connection;
import java.sql.DriverManager;



// �̱��� ��ü 
public class DBConfig {  
			
			private static DBConfig instance = new DBConfig();
			private DBConfig() {}
			public static  DBConfig getInstance() { 
				
				return instance; 
			
			} 
			
			private final String HOST = "jdbc:mysql://13.209.14.14:3306/jinhaday";
			private final String USER = "jinhaday";
			private final String PASS = "1234";
			
			
			public Connection  getConnection() throws Exception {  
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
				return conn;
			}
}
