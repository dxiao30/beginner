package org.soft.hotel.model;

/**
   * 普通客户
 * @author Administrator
 *
 */
public class Client {

	private int clientId; 
	private String clientName;  //客户姓名
	private String clientIdCard;//客户身份证号
	private String clientPhone;//客户手机号
	private String clientPass;//客户密码
	
	public Client() {
		
	}
	
	public Client(int clientId) {
		this.clientId = clientId;
	}



	public Client(int clientId, String clientName, String clientIdCard, String clientPhone,String clientPass) {
		this.clientId = clientId;
		this.clientName = clientName;
		this.clientIdCard = clientIdCard;
		this.clientPhone = clientPhone;
		this.clientPass = clientPass;
	}



	public int getClientId() {
		return clientId;
	}



	public void setClientId(int clientId) {
		this.clientId = clientId;
	}



	public String getClientName() {
		return clientName;
	}



	public void setClientName(String clientName) {
		this.clientName = clientName;
	}



	public String getClientIdCard() {
		return clientIdCard;
	}



	public void setClientIdCard(String clientIdCard) {
		this.clientIdCard = clientIdCard;
	}



	public String getClientPhone() {
		return clientPhone;
	}



	public void setClientPhone(String clientPhone) {
		this.clientPhone = clientPhone;
	}
	
	public String getClientPass(){
		return clientPass;
	}
	public void setClientPass(String clientPass){
		this.clientPass = clientPass;
	}
}
