package org.soft.hotel.server.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.soft.hotel.model.Client;
import org.soft.hotel.model.Reservation;
import org.soft.hotel.model.Room;
import org.soft.hotel.model.Users;
import org.soft.hotel.server.IncomeServer;
import org.soft.hotel.server.ReservationServer;
import org.soft.hotel.server.RoomServer;
import org.soft.hotel.server.UsersServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 预订模块
 * @author Administrator
 *
 */
@Controller
public class ReservationServerCtrl {

	@Autowired
	@Qualifier("ReservationServer")
	private ReservationServer reservationServer;
	
	@Autowired
	@Qualifier("RoomServer")
	private RoomServer roomServer;
	
	@Autowired
	@Qualifier("IncomeServer")
	private IncomeServer incomeServer;
	
	//用于存储输入框输入的房间号
	private String roomNumbers;
	
	/**
	 * 预订登记
	 * @param reservation
	 * @return
	 */
	@RequestMapping("/reservation")
	public String reservation(Reservation reservation,int paymentMethod) {
		String path = "error";
		//修改房间状态为预订状态
		int roomStatus = 1;
		int roomId = reservation.getRoomId();	
		boolean b = roomServer.updateRoomStatus(roomStatus, roomId);	 	
		if(b) {
			int roomTypeId = roomServer.showRoomTypeId(roomId);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("roomTypeId",roomTypeId);
			map.put("staffId", reservation.getStaffId());
			map.put("paymentMethod", paymentMethod);
			map.put("incomeTime", reservation.getReservationTime());
			map.put("incomeMoney",reservation.getReservationForegift());
			map.put("incomeType",1);
			//新增收入
			incomeServer.addIncome(map);
			//添加预订记录
			boolean reservations = reservationServer.reservation(reservation);
			if(reservations) {
				path = "redirect:/showAllRoom/"+roomTypeId;
			}			
		}
		return path;
	}
	
	/**
	 * 客户在官网预订登记
	 * @param reservation
	 * @return
	 */
	@RequestMapping("/userReservation")
	public String userReservation(Reservation reservation,HttpSession httpSession,int roomTypeId) {
		String path = "error";
		Users users = (Users) httpSession.getAttribute("userss");
		Client client = (Client) httpSession.getAttribute("client");
		if(users != null){
			reservation.setReservationName(users.getUserRealName());
			reservation.setReservationIdCard(users.getUserIdCard());
			reservation.setReservationPhoneNumber(users.getUserPhone());
		}
		if(client != null){
			reservation.setReservationIdCard(client.getClientIdCard());
			reservation.setReservationName(client.getClientName());
			reservation.setReservationPhoneNumber(client.getClientPhone());

		}
		reservation.setRoomTypeId(roomTypeId);
		int reservationStatus = 3;
		reservation.setReservationStatus(reservationStatus);
			//添加预订记录
			boolean reservations = reservationServer.reservation(reservation);
			if(reservations) {
				path = "redirect:/gatewayShowAllRoomType/0";
			}			
		return path;
	}
	
	/**
	 * 删除预订记录
	 * @param reservationId
	 * @return
	 */
	@RequestMapping("/deleteReservation")
	public String deleteReservation(int reservationId) {
		String path = "error";
		boolean b = reservationServer.deleteReservation(reservationId);

		if(b) {
			path = "redirect:/showAllReservation/1";
		}
		return path;
	}
	
	/**
	 * 修改预订记录的预订人信息
	 * @param
	 * @return
	 */
	@RequestMapping("/updateReservationUsers")
	public String updateReservationUsers(Reservation reservation) {
			String path = "error";
			boolean b = reservationServer.updateReservationUsers(reservation);
			if(b) {
				path = "redirect:/showAllReservation/1";
			}
			return path;
	}
	
	/**
	 * 查看所有预订记录
	 * @return
	 */
	@RequestMapping(value = "/showAllReservation/{nowPage}")
	public String showAllReservation(@PathVariable("nowPage") int nowPage,Model model){
		String path = "error";	
		//显示条数
		int size = 10;		
		//数据总条数
		int allPage = reservationServer.allPage();
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
		List<Reservation> reservations = reservationServer.showAllReservation(map);
		if(reservations != null) {
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "reservation/reservationOp";
		}
		return path;
	}

	/**
	 * 查询我的预定订单
	 */
	@RequestMapping(value = "/showReservationIdCard/{id}/{nowPage}")
	public String showMyOrder(@PathVariable("id") String id,@PathVariable("nowPage") int nowPage,String roomNumber, Model model){
		String path = "error";
		//显示条数
		int size = 5;
		//总条数
		int allPage = reservationServer.showInputNameAllPage(id);
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
		//从当前数据库查询位置
		int nowPageNum = (nowPage - 1) * size;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("reservationIdCard",id);
		map.put("nowPageNum", nowPageNum);
		map.put("size", size);
		List<Reservation> reservations = reservationServer.showReservationIdCard(map);
		if(reservations != null) {
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "gateway/MyOrder";
		}

		return path;
	}
	
	/**
	 * 查看输入框指定房间下的所有预订记录
	 * @return
	 */
	@RequestMapping(value = "/showInputReservation/{nowPage}")
	public String showInputReservation(@PathVariable("nowPage") int nowPage,String roomNumber,Model model){
		String path = "error";
		if(roomNumber != null) {
			roomNumbers = roomNumber;
		}
		//通过房间号查询房间类型Id和房间Id
		Room room = roomServer.showRoomTypeIdAndRoomId(roomNumbers);
		int roomId = room.getRoomId();
		//显示条数
		int size = 2;		
		//数据总条数
		int allPage = reservationServer.showInputAllPage(roomId);
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
		map.put("roomId", roomId);
		map.put("nowPageNum", nowPageNum);
		map.put("size", size);
		List<Reservation> reservations = reservationServer.showInputReservation(map);
		if(reservations != null) {
			model.addAttribute("roomNumbers", roomNumbers);
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "reservation/reservationInp";
		}
		return path;
	}
	
	/**
	 * 修改预订记录进行退订
	 * @param
	 * @return
	 */
	@RequestMapping("/updateReservation")
	public String updateReservation(Reservation reservation) {
			String path = "error";
			int roomStatus = 0;
			int roomId = reservation.getRoomId();
			//修改房间状态为空闲
			boolean updateRoomStatus = roomServer.updateRoomStatus(roomStatus, roomId);
			if(updateRoomStatus) {
				//如果修改房间状态成功，则修改预订记录
				int reservationStatus = 2;
				boolean b = reservationServer.UpdateReservation(reservation);
				if(b) {
					path = "redirect:/showAllReservation/1";
				}else {
					//如果修改不成功，则修改房间记录为预订
					roomStatus = 1;
					roomServer.updateRoomStatus(roomStatus, roomId);
				}
			}			 
			return path;
	}
	
	/**
	 * 查看退订记录
	 * @return
	 */
	@RequestMapping(value = "/showAllUnsubscribeReservation/{nowPage}")
	public String showAllUnsubscribeReservation(@PathVariable("nowPage") int nowPage,Model model){
		String path = "error";	
		//显示条数
		int size = 10;		
		//数据总条数
		int allPage = reservationServer.allUnsubscribePage();
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
		List<Reservation> reservations = reservationServer.showAllUnsubscribeReservation(map);
		if(reservations != null) {
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "reservation/reservationUnsubscribe";
		}
		return path;
	}
	
	/**
	 * 查看已入住记录
	 * @return
	 */
	@RequestMapping(value = "/showAllCheckInReservation/{nowPage}")
	public String showAllCheckInReservation(@PathVariable("nowPage") int nowPage,Model model){
		String path = "error";	
		//显示条数
		int size = 10;		
		//数据总条数
		int allPage = reservationServer.allCheckInPage();
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
		List<Reservation> reservations = reservationServer.showAllCheckInReservation(map);
		if(reservations != null) {
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "reservation/reservationCheckIn";
		}
		return path;
	}
	/**
	 * 查看预订中记录
	 * @return
	 */
	@RequestMapping(value = "/showAllNoCheckInReservation/{nowPage}")
	public String showAllNoCheckInReservation(@PathVariable("nowPage") int nowPage,Model model){
		String path = "error";	
		//显示条数
		int size = 10;		
		//数据总条数
		int allPage = reservationServer.allNoCheckInPage();
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
		List<Reservation> reservations = reservationServer.showAllNoCheckInReservation(map);
		if(reservations != null) {
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "reservation/reservationNoCheckIn";
		}
		return path;
	}
	
	/**
	 * 查看未处理预订订单
	 * @return
	 */
	@RequestMapping(value = "/showUserReservation/{nowPage}")
	public String showUserReservation(@PathVariable("nowPage") int nowPage,Model model){
		String path = "error";	
		//显示条数
		int size = 10;		
		//数据总条数
		int allPage = reservationServer.allUserReservation();
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
		List<Reservation> reservations = reservationServer.showUserReservation(map);
		if(reservations != null) {
			model.addAttribute("reservations", reservations);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("allPageNum", allPageNum);
			model.addAttribute("beginPage", beginPage);
			model.addAttribute("endPage", endPage);
			path = "reservation/userReservation";
		}
		return path;
	}
}
