package com.org.TestApp.controller;


import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.org.TestApp.objects.ScenarioDetails;
import com.org.TestApp.objects.Scenarios;

@Repository
public class ScenarioDetailsService {
	@Autowired
	private MongoTemplate mongoTemplate;
	
	private String COLLECTION_NAME = ScenarioDetails.class.getSimpleName(); // --------1)

	public void addScenarioDetails(ScenarioDetails details) {
		if (!mongoTemplate.collectionExists(ScenarioDetails.class)) { // ---------2)
			mongoTemplate.createCollection(ScenarioDetails.class);
		}
		//details.setId(UUID.randomUUID().toString());
		mongoTemplate.insert(details, COLLECTION_NAME); // ------3)
	}

	public List<ScenarioDetails> listScenarioDetails() {
		return mongoTemplate.findAll(ScenarioDetails.class, COLLECTION_NAME);
	}
	
	public List<ScenarioDetails> listScenarioDetails(String clientId,String scenarioId) {
		Query searchUserQuery = new Query();//(Criteria.where("clientId").is(clientId));
		searchUserQuery.addCriteria(Criteria.where("scenarioId").is(scenarioId));
		searchUserQuery.addCriteria(Criteria.where("clientId").is(clientId));
		return mongoTemplate.find(searchUserQuery,ScenarioDetails.class, COLLECTION_NAME);
	}

}