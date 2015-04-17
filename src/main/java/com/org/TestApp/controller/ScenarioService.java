package com.org.TestApp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.org.TestApp.objects.Scenarios;

@Repository
public class ScenarioService {
	@Autowired
	private MongoTemplate mongoTemplate;
	
	private String COLLECTION_NAME = Scenarios.class.getSimpleName(); // --------1)

	public void addScenarios(Scenarios details) {
		if (!mongoTemplate.collectionExists(Scenarios.class)) { // ---------2)
			mongoTemplate.createCollection(Scenarios.class);
		}
		//details.setId(UUID.randomUUID().toString());
		try {
			mongoTemplate.insert(details, COLLECTION_NAME); // ------3)
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Scenarios> listScenarios() {
		return mongoTemplate.findAll(Scenarios.class, COLLECTION_NAME);
	}
	
	public List<Scenarios> listScenarios(String clientId) {
		Query searchUserQuery = new Query(Criteria.where("clientId").is(clientId));
		return mongoTemplate.find(searchUserQuery,Scenarios.class);
		//return mongoTemplate.findAll(Scenarios.class, COLLECTION_NAME);		
	}

}