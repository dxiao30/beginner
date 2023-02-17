package org.soft.hotel.server;

import java.util.List;
import java.util.Map;


import org.soft.hotel.dao.ClientDAO;
import org.soft.hotel.model.Client;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("ClientServer")
public class ClientServer {

	@Autowired
	private ClientDAO clientDAO;
	
	/**
	 * 新增客户
	 * @return
	 */
	public boolean NewClient(Map<String, Object> map) {
		boolean b = clientDAO.NewClient(map);
		return b;
	}
	
	/**
	 * 修改客户信息
	 * @param client
	 * @return
	 */
	public boolean updateClient(Client client) {
		boolean b = clientDAO.updateClient(client);
		return b;
	}
	
	/**
	 * 删除客户信息
	 * @param clientId
	 * @return
	 */
	public boolean deleteClient(int clientId) {
		boolean b = clientDAO.deleteClient(clientId);
		return b;
	}
	
	/**
	 * 通过入住身份证号查询客户信息
	 * @param
	 * @return
	 */
	public int showClientIds(String checkinIdCard) {
		int clientIds = clientDAO.showClientIds(checkinIdCard);
		return clientIds;
	}
	
	/**
	 * 通过入住身份证号查询客户信息
	 * @param
	 * @return
	 */
	public int showClientId(String checkinIdCard) {
		int clientId = clientDAO.showClientId(checkinIdCard);
		return clientId;
	}
	
	/**
	 *  通过客户Id查询客户信息
	 * @param clientId
	 * @return
	 */
	public Client showClient(int clientId) {
		Client client = clientDAO.showClient(clientId);
		return client;
	}
	
	/**
	 * 查看所有客户信息
	 * @return
	 */
	public List<Client> showAllClient(Map<String, Object> map){
		List<Client> clients = clientDAO.showAllClient(map);
		return clients;
	}
	
	/**
	 * 查询客户信息的总页数
	 * @param
	 * @return
	 */
	public int allClientPage() {
		int allClientPageNum = clientDAO.allClientPage();
		return allClientPageNum;
	}
	
	/**
	 * 查看所有客户信息
	 * @return
	 */
	public List<Client> showInputAllClient(Map<String, Object> map){
		List<Client> clients = clientDAO.showInputAllClient(map);
		return clients;
	}
	
	/**
	 * 查询客户信息的总页数
	 * @param
	 * @return
	 */
	public int allInputClientPage(String clientNames) {
		int allClientPageNum = clientDAO.allInputClientPage(clientNames);
		return allClientPageNum;
	}
	
	/**
	 * 搜索框输入条件下的普通客户ID
	 * @param
	 * @return
	 */
	public int showInputClientId(String clientName) {
		int clientId =clientDAO.showInputClientId(clientName);
		return clientId;
	}


	/**
	 * 用户登录
	 *
	 * @param client 用户
	 * @return {@link Client}
	 */
	public Client clientLogin(Client client){
		client = clientDAO.clientLogin(client);
		return client;
	}

	/**
	 * 用户注册是判断账号是否重复
	 * @param clientIdCard
	 * @return
	 */
	public int showClientclientIdCard(String clientIdCard){
		int showClientIdCard = clientDAO.showClientclientIdCard(clientIdCard);
		return showClientIdCard;
	}
}
