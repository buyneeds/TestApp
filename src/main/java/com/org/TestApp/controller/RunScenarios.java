package com.org.TestApp.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class RunScenarios {
	
	private Map map;
	
	public RunScenarios(Map map){
		this.map = map;
	}

	public boolean execute() {
		// TODO Auto-generated method stub
		System.out.println("RunScenarios.execute()");
		
		try { 
			
			Iterator iterator = map.keySet().iterator();
			
			while (iterator.hasNext()) {
				String key = (String) iterator.next();
				boolean value = (Boolean)map.get(key);
				
				if(value){
					
					//do ur selenium code here
					
					System.out.println("RunScenarios.execute() :: "+key+" <===Scenario Execution begins===>");
					
					
					
					
					
					System.out.println("RunScenarios.execute() :: "+key+" <===Scenario Execution ends===>");
					
				}
				
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}
	
	

}
