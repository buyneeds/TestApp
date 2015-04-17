package com.org.TestApp.dbutils;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;

public class DBConnection{ 
	
	
	private static DBConnection dbConnection;
	private static DB db;

	private DBConnection(){
		
			getDb();
	}
	
	public static DB getDb(){
		try {
			if(db==null){
				MongoClient mongo = new MongoClient("localhost", 27017);
				db=mongo.getDB("TEST_APP");
			}
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return db;
	}
	
	public static DBConnection getConnection(){	
		
			if(dbConnection==null||getDb()==null){
			//	dbConnection=new DBConnection();		
				dbConnection = new DBConnection();			
				//org.springframework.data.mongodb.core.MongoOperations
				/**** Get database ****/
				// if database doesn't exists, MongoDB will create it for you			
			}
		return dbConnection;
	}
	
	public void save(BasicDBObject obj) {
		try {
			//dbConnection.mongoTemplate.insert(obj, obj.getClass().getName());
			DBCollection table = getConnection().getDb().getCollection(obj.getClass().getSimpleName());
			table.insert(obj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.toString());
		}
	}
	
	public List getTable(String tableName){
		//return dbConnection.mongoTemplate.findAll(classObj.getClass(), classObj.getClass().getName());
		DBCollection table = getConnection().db.getCollection(tableName);
		DBCursor dbCursor = table.find();
		List list = new ArrayList();
		while (dbCursor.hasNext()) {
			list.add(dbCursor.next());
		}
		System.out.println(tableName+"==>"+list.size());
		return list;
	}
}
