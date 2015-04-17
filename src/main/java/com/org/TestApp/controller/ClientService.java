package com.org.TestApp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.org.TestApp.objects.Client;

@Repository
public class ClientService {
	@Autowired
	private MongoTemplate mongoTemplate;
	
	private String COLLECTION_NAME = Client.class.getSimpleName(); // --------1)

	public void addClient(Client details) {
		if (!mongoTemplate.collectionExists(Client.class)) { // ---------2)
			mongoTemplate.createCollection(Client.class);
		}
		//details.setId(UUID.randomUUID().toString());
		mongoTemplate.insert(details, COLLECTION_NAME); // ------3)
	}

	public List<Client> listClient() {
		return mongoTemplate.findAll(Client.class, COLLECTION_NAME);
	}

}