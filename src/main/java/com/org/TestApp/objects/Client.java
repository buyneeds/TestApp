package com.org.TestApp.objects;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.google.gson.Gson;

@Document
public class Client {
	
	@Id
	private String clientId;

	private String clientName;
	
	private boolean activeFlag;

	private Date createTstamp;

	private Date modifyTstamp;
	
	
	public Date getModifyTstamp() {
		return modifyTstamp;
	}

	private void setModifyTstamp(Date modifyTstamp) {
		this.modifyTstamp = modifyTstamp;
	}

	public String getClientId() {
		return clientId;
	}

	public void setClientId(String clientId) {
		this.clientId = clientId;
		setModifyTstamp(new Date());
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
		setModifyTstamp(new Date());
	}

	public Date getCreateTstamp() {
		return createTstamp;
	}

	public boolean isActiveFlag() {
		return activeFlag;
	}

	public void setActiveFlag(boolean activeFlag) {
		this.activeFlag = activeFlag;
		setModifyTstamp(new Date());
	}	

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return new Gson().toJson(this);
	}

}