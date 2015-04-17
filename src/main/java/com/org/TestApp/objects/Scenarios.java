package com.org.TestApp.objects;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.google.gson.Gson;

@Document
public class Scenarios {
	
	@Id	
	private String KEY;//clientId+scenarioId
	
	private String clientId;
	
	private String scenarioId;
	
	private String scenarioName;
	
	private boolean activeFlag;
	
	private Date createTstamp;
	
	private Date modifyTstamp;

	
	public String getKEY() {
		return KEY;
	}

	public void setKEY(String kEY) {
		KEY = kEY;
	}

	public void setKEY(String client,String scenario) {
		this.clientId = client;
		this.scenarioId=scenario;
		this.activeFlag=true;
		setKEY(this.clientId+this.scenarioId);
	}

	public String getClientId() {
		return clientId;
	}


	public void setClientId(String clientId) {
		this.clientId = clientId;
	}


	public String getScenarioId() {
		return scenarioId;
	}


	public void setScenarioId(String scenarioId) {
		this.scenarioId = scenarioId;
	}


	public String getScenarioName() {
		return scenarioName;
	}


	public void setScenarioName(String scenarioName) {
		this.scenarioName = scenarioName;
	}


	public boolean isActiveFlag() {
		return activeFlag;
	}


	public void setActiveFlag(boolean activeFlag) {
		this.activeFlag = activeFlag;
	}


	public Date getCreateTstamp() {
		return createTstamp;
	}


	public void setCreateTstamp(Date createTstamp) {
		this.createTstamp = createTstamp;
	}


	public Date getModifyTstamp() {
		return modifyTstamp;
	}


	public void setModifyTstamp(Date modifyTstamp) {
		this.modifyTstamp = modifyTstamp;
	}


	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return new Gson().toJson(this);
	}
}
