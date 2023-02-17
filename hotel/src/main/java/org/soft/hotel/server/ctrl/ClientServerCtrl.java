package org.soft.hotel.server.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mysql.cj.Session;
import org.soft.hotel.model.Client;
import org.soft.hotel.model.Users;
import org.soft.hotel.server.ClientServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 普通客户模块
 * @author Administrator
 *
 */
@Controller
public class ClientServerCtrl {

	@Autowired
	@Qualifier("ClientServer")
	private ClientServer clientServer;
	
	//存储搜索客户输入框输入的信息
	private String clientNames;


	/**
	 * 用户登录
	 * @param client
	 * @param request
	 * @return
	 */
	@RequestMapping("/clientLogin")
	public String clientLogin(Client client, HttpServletRequest request) {
		String path = "error";
		client = clientServer.clientLogin(client);
		if(client != null) {
			request.getSession().setAttribute("client", client);
			path = "redirect:/gatewayShowAllRoomType/0";
		}
		return path;
	}


	/**
	 * 客户注销
	 *
	 * @param session 会话
	 * @return {@link String}
	 */
	@RequestMapping(value = "/clientCancellation",method = RequestMethod.GET)
	public String clientCancellation(HttpSession session){
		session.invalidate();
		return "redirect:/gatewayShowAllRoomType/0";
	}

	/**
	 * 用户注册
	 * @param client
	 * @return
	 */
	@RequestMapping("/clientRegist")
	public String clientRegist(Client client, HttpSession session){
		String path = null;
		String clientIdCard = client.getClientIdCard();
		String clientName = client.getClientName();
		String clientPhone = client.getClientName();
		String clientPass = client.getClientName();
		int showclientIdCard = clientServer.showClientclientIdCard(clientIdCard);
		if (showclientIdCard == 0){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("clientName", clientName);
			map.put("clientIdCard", clientIdCard);
			map.put("clientPhone", clientPhone);
			map.put("clientPass", clientPass);
			boolean b = clientServer.NewClient(map);
			path = "gateway/clientLogin";
		}else {
			int msg = 0;
			session.setAttribute("msg",msg);
			path = "gateway/clientRegist";
		}
		return path;
	}
	
	/**
	 * 修改客户信息
	 * @param client
	 * @return
	 */
	@RequestMapping("/updateClient")
	public String updateClient(Client client) {
		String path = "error";
		boolean b = clientServer.updateClient(client);
		if(b) {
			path = "redirect:/showAllClient/1";
		}
		return path;
	}
	
	/**
	 * 删除客户信息
	 * @param clientId
	 * @return
	 */
	@RequestMapping("/deleteClient")
	public String deleteClient(int clientId) {
		String path = "error";
		boolean b = clientServer.deleteClient(clientId);
		if(b) {
			path = "redirect:/showAllClient/1";
		}
		return path;
	}
	
	/**
	 * 查看所有客户信息
	 * @return
	 */
	@RequestMapping(value = "showAllClient/{nowPage}")
	public String showAllClient(@PathVariable("nowPage") int nowPage,Model model){
		String path = "error";	
		//显示条数
		int size = 2;		
		//数据总条数
		int allPage = clientServer.allClientPage();
		//总页数
		int allPageNum = 1;
		if(allPage % size >0) {
			allPageNum = allPage / size +1;
		}else if(allPage % size == 0) {
			allPageNum = allPage / size;
		}
		//显示页数最大个数
		int PageSize = 4;
		
		if(nowPage > allPageNum) {
			nowPage =allPageNum;
		}
		//当前页数
		if(nowPage <=0) {
			nowPage = 1;
		}
		//分页遍历起始页码
		int beginPage = nowPage;
		//分页遍历结束页码
		int endPage = beginPage +PageSize;	
		if(endPage > allPageNum) {
			endPage = allPageNum;
		}
		if(beginPage >allPageNum-PageSize) {
			beginPage = allPageNum-PageSize;
			if(beginPage<=0) {
				beginPage = 1;
			}
		}
		//当前数据库查询的起始位置
		int nowPageNum = (nowPage - 1) * size;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowPageNum", nowPageNum);
		map.put("size", size);
		
		List<Client> clients =  clientServer.showAllClient(map);
		if(clients != null) {
			model.addAttribute("clients", clients);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "client/clientOperation";
		}
		return path;
	}
	/**
	 * 查看所有客户信息
	 * @return
	 */
	@RequestMapping(value = "showInputAllClient/{nowPage}")
	public String showInputAllClient(@PathVariable("nowPage") int nowPage,String clientName,Model model){
		String path = "error";	
		//显示条数
		int size = 2;		
		if(clientName != null) {
			clientNames = clientName;
		}
		//数据总条数
		int allPage = clientServer.allInputClientPage(clientNames);
		//总页数
		int allPageNum = 1;
		if(allPage % size >0) {
			allPageNum = allPage / size +1;
		}else if(allPage % size == 0) {
			allPageNum = allPage / size;
		}
		//显示页数最大个数
		int PageSize = 4;
		
		if(nowPage > allPageNum) {
			nowPage =allPageNum;
		}
		//当前页数
		if(nowPage <=0) {
			nowPage = 1;
		}
		//分页遍历起始页码
		int beginPage = nowPage;
		//分页遍历结束页码
		int endPage = beginPage +PageSize;	
		if(endPage > allPageNum) {
			endPage = allPageNum;
		}
		if(beginPage >allPageNum-PageSize) {
			beginPage = allPageNum-PageSize;
			if(beginPage<=0) {
				beginPage = 1;
			}
		}
		//当前数据库查询的起始位置
		int nowPageNum = (nowPage - 1) * size;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowPageNum", nowPageNum);
		map.put("size", size);
		map.put("clientNames", clientNames);
		List<Client> clients =  clientServer.showInputAllClient(map);
		if(clients != null) {
			model.addAttribute("clientNames", clientNames);
			model.addAttribute("clients", clients);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "client/clientInp";
		}
		return path;
	}
}
