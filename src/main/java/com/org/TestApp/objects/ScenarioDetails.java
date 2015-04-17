package com.org.TestApp.objects;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.google.gson.Gson;

@Document
public class ScenarioDetails {

	
	@Id	
	private String KEY;//clientId+scenarioId+stepNo
	
	private String clientId;	
	
	private String scenarioId;
	
	private long stepNo;
	
	private String stepDesc;

	private boolean activeFlag;
	
	private Date createTstamp;
	
	private Date modifyTstamp;
	
	public String getKEY() {
		return KEY;
	}

	public void setKEY(String kEY) {
		KEY = kEY;
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

	public long getStepNo() {
		return stepNo;
	}

	public void setStepNo(long stepNo) {
		this.stepNo = stepNo;
	}

	public String getStepDesc() {
		return stepDesc;
	}

	public void setStepDesc(String stepDesc) {
		this.stepDesc = stepDesc;
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

	public void setKEY(String clientId2, String scenarioId2, int stepNo) {
		// TODO Auto-generated method stub
		this.clientId = clientId2;
		this.scenarioId = scenarioId2;
		this.stepNo = stepNo;
		this.activeFlag=true;
		setKEY(clientId2+scenarioId2+stepNo);
	}
}
