package com.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GetData {
	private static Connection connection;
	private static ResultSet rset = null;  
	private static Statement stmt = null;
    public GetData() {}
    private static void startCon(){
    	 
    	try {
    		connection = DBConnection.getConnection();
			stmt = connection.createStatement();
			String sql="USE new_database";
			stmt.executeUpdate(sql);
			
		} catch (SQLException e1) {
			
			e1.printStackTrace();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
    	
    }
    public static ArrayList<String> getForDropDown(String type) { 
        stmt = null;
    	startCon();
    	rset = null; 
        stmt = null;
        ArrayList<String> listGenres = new ArrayList<String>();
        try {
			stmt = connection.createStatement();
			rset = stmt.executeQuery("SELECT DISTINCT Genre FROM CDs WHERE Type='"+type+"'"); 
		      while( rset.next() ) {      
		          listGenres.add(rset.getString("Genre"));   
		         }
		      if(rset!=null)rset.close();
			  if(stmt !=null)stmt .close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
      return listGenres;
    }
    
    public static ArrayList<CD> getProdListByTypeAndGenre(String type,String genre) {  
        stmt = null;
    	startCon();
    	rset = null; 
        stmt = null;
    	ArrayList<CD> productList = new ArrayList<CD>();
        try {
			stmt = connection.createStatement();
			rset = stmt.executeQuery("SELECT * FROM CDs WHERE Type='"+type+"'"+"AND Genre='"+genre+"'");
	        while (rset.next())
			{
				CD item = new CD();
				item.setType(rset.getString(2));
				item.setGenre(rset.getString(3));
				item.setName(rset.getString(4));
				productList.add(item);
			 }
			if(rset!=null)rset.close();
		    if(stmt !=null)stmt .close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
		 	return productList;	 
    }
    public static ArrayList<CD> getProdListByName(String name){ 
        stmt = null;
    	startCon();
    	rset = null; 
        stmt = null;
        ArrayList<CD> productList = new ArrayList<CD>();  
        try {
			stmt = connection.createStatement();
			rset = stmt.executeQuery("SELECT * FROM CDs WHERE Name LIKE '%"+ name +"%'");
	        while (rset.next())
			{
				CD item = new CD();
				item.setType(rset.getString(2));
				item.setGenre(rset.getString(3));
				item.setName(rset.getString(4));
				 productList.add(item);
			 }
			if(rset!=null)rset.close();
		    if(stmt !=null)stmt .close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
		 	return productList; 
    }
    public static ArrayList<CD> getProdList() {
        stmt = null;
    	startCon();
    	rset = null; 
        stmt = null;
        ArrayList<CD> productList = new ArrayList<CD>();
        try {
			stmt = connection.createStatement();
			rset = stmt.executeQuery("SELECT * FROM CDs");
	        while (rset.next())
			{
				CD item = new CD();
				item.setType(rset.getString(2));
				item.setGenre(rset.getString(3));
				item.setName(rset.getString(4));
				 productList.add(item);
			 }
			if(rset!=null)rset.close();
		    if(stmt !=null)stmt .close();
		} catch (SQLException e) {
			e.printStackTrace();
		}  
        
		 	return productList;
		 
    }
    public static ArrayList<CD> getNewItems()
	{
    	stmt = null;
    	startCon();
    	rset = null; 
        stmt = null;
		ArrayList<CD> newItemsList = new ArrayList<CD>();
		ArrayList<String> genresList = new ArrayList<String>();
		try {
			stmt = connection.createStatement();
			rset = stmt.executeQuery("SELECT DISTINCT genre FROM CDs");
			while(rset.next()){
			genresList.add(rset.getString(1));
			}
			for(int i=0;i<genresList.size();i++){
			 rset = stmt.executeQuery(
					"SELECT * FROM ("
					+ "SELECT * FROM CDs "
					+ "ORDER BY CD_id DESC "
					+ ") AS CDdata WHERE CDdata.genre ='"+ genresList.get(i) + "' ORDER BY CD_id DESC LIMIT 1");
			while (rset.next())
			{
				CD item = new CD();
				item.setType(rset.getString(2));
				item.setGenre(rset.getString(3));
				item.setName(rset.getString(4));
				 newItemsList.add(item);}
			 }
			if(rset!=null)rset.close();
		    if(stmt!=null)stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		 return newItemsList;
}
    public static  ArrayList<CD> getPaginProdList(
            int offset, 
            int noOfRecords,ArrayList<CD> productList ) {
		 ArrayList<CD> paginProductList = new ArrayList<CD>();
	 for( int i=offset ;i<offset+noOfRecords;i++){
		 try {
			 if ( i>productList.size()-1)break;
			paginProductList.add( productList.get(i));
		} catch (Exception e) {
			e.printStackTrace();
			}
		 } 
	 return paginProductList;
	 }
    }
