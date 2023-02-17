package org.soft.hotel.server.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.soft.hotel.model.Checkin;
import org.soft.hotel.model.Maintain;
import org.soft.hotel.model.Room;
import org.soft.hotel.model.RoomType;
import org.soft.hotel.server.CheckInServer;
import org.soft.hotel.server.MaintainServer;
import org.soft.hotel.server.RoomServer;
import org.soft.hotel.server.RoomTypeServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 房间模块
 * @author Administrator
 *
 */
@Controller
public class RoomServerCtrl {

	@Autowired
	@Qualifier("RoomServer")
	private RoomServer roomServer;
	
	@Autowired
	@Qualifier("MaintainServer")
	private MaintainServer maintainServer;
	
	@Autowired
	@Qualifier("RoomTypeServer")
	private RoomTypeServer roomTypeServer;

	@Autowired
	@Qualifier("CheckInServer")
	private CheckInServer checkInServer;
	
	/**
	 * 新增房间
	 * @param room
	 * @return
	 */
	@RequestMapping("/newRoom")
	public String newRoom(Room room) {
		String path = "error";
		boolean b = roomServer.newRoom(room);
		if(b) {
			int roomTypeId = room.getRoomTypeId();
			path = "redirect:/showAllRoom/"+roomTypeId;
		}
		return path;
	}
	/**
	 * 修改房间信息
	 * @param room
	 * @return
	 */
	@RequestMapping("/updateRoom")
	public String updateRoom(Room room) {
		String path = "error";
		boolean b = roomServer.updateRoom(room);
		if(b) {
			int roomTypeId = room.getRoomTypeId();
			path = "redirect:/showAllRoom/"+roomTypeId;
		}
		return path;
	}
	/**
	 * 删除房间
	 * @param roomId
	 * @return
	 */
	@RequestMapping("/deleteRoom")
	public String deleteRoom(int roomId) {
		String path = "error";
		int roomTypeId = roomServer.showRoomTypeId(roomId);
		boolean b = roomServer.deleteRoom(roomId);
		if(b) {
			path = "redirect:/showAllRoomEdit/"+roomTypeId;
		}
		return path;
	}
	/**
	 * 查询指定房间类型的所有房间
	 * @param roomTypeId
	 * @return
	 */
	@RequestMapping(value = "/showAllRoom/{roomTypeId}")
	public String showAllRoom(@PathVariable("roomTypeId") int roomTypeId,Model model){
		String path = "error";
		List<Room> rooms = roomServer.showAllRoom(roomTypeId);
		RoomType roomType =roomServer.showRoomType(roomTypeId);
		if(rooms != null) {
			int countRoomType =  roomServer.countRoomType(roomTypeId); 
			int countReservationRoomType =roomServer.countReservationRoomType(roomTypeId);
			int countCheckinRoomType = roomServer.countCheckinRoomType(roomTypeId);
			int countFreeRoomType = roomServer.countFreeRoomType(roomTypeId);
			int countNotCleanedRoomType = roomServer.countNotCleanedRoomType(roomTypeId);
			int countRepairRoomType = roomServer.countRepairRoomType(roomTypeId);
			model.addAttribute("countRoomType", countRoomType);
			model.addAttribute("countReservationRoomType", countReservationRoomType);
			model.addAttribute("countCheckinRoomType", countCheckinRoomType);
			model.addAttribute("countFreeRoomType", countFreeRoomType);
			model.addAttribute("countNotCleanedRoomType", countNotCleanedRoomType);
			model.addAttribute("countRepairRoomType", countRepairRoomType);
			model.addAttribute("roomType", roomType);
			model.addAttribute("roomTypeId", roomTypeId);
			model.addAttribute("rooms", rooms);
			path = "/room/roomOp";
		}
		return path;
	}

	/**
	 * 编辑指定房间类型的所有房间
	 * @param roomTypeId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/showAllRoomEdit/{roomTypeId}")
	public String showAllRoomEdit(@PathVariable("roomTypeId") int roomTypeId,Model model){
		String path = "error";
		List<Room> rooms = roomServer.showAllRoom(roomTypeId);
		RoomType roomType =roomServer.showRoomType(roomTypeId);
		if(rooms != null) {
			int countRoomType =  roomServer.countRoomType(roomTypeId);
			int countReservationRoomType =roomServer.countReservationRoomType(roomTypeId);
			int countCheckinRoomType = roomServer.countCheckinRoomType(roomTypeId);
			int countFreeRoomType = roomServer.countFreeRoomType(roomTypeId);
			int countNotCleanedRoomType = roomServer.countNotCleanedRoomType(roomTypeId);
			int countRepairRoomType = roomServer.countRepairRoomType(roomTypeId);
			model.addAttribute("countRoomType", countRoomType);
			model.addAttribute("countReservationRoomType", countReservationRoomType);
			model.addAttribute("countCheckinRoomType", countCheckinRoomType);
			model.addAttribute("countFreeRoomType", countFreeRoomType);
			model.addAttribute("countNotCleanedRoomType", countNotCleanedRoomType);
			model.addAttribute("countRepairRoomType", countRepairRoomType);
			model.addAttribute("roomType", roomType);
			model.addAttribute("roomTypeId", roomTypeId);
			model.addAttribute("rooms", rooms);
			path = "/room/roomEdit";
		}
		return path;
	}

	/**
	 * 输入框查询指定房间类型的房间
	 * @param roomTypeId
	 * @return
	 */
	@RequestMapping(value = "/inputShowRoom")
	public String inputShowRoom(String roomNumber,Model model){
		String path = "error";
		List<Room> rooms = roomServer.inputShowRoom(roomNumber);
		if(rooms != null) {
			int countRoomType = roomServer.countRoom();
			int countReservationRoomType = roomServer.countReservation();
			int countCheckinRoomType = roomServer.countCheckin();
			int countFreeRoomType =roomServer.countFree();
			int countNotCleanedRoomType = roomServer.countNotCleaned();
			int countRepairRoomType = roomServer.countRepair();
			model.addAttribute("countRoomType", countRoomType);
			model.addAttribute("countReservationRoomType", countReservationRoomType);
			model.addAttribute("countCheckinRoomType", countCheckinRoomType);
			model.addAttribute("countFreeRoomType", countFreeRoomType);
			model.addAttribute("countNotCleanedRoomType", countNotCleanedRoomType);
			model.addAttribute("countRepairRoomType", countRepairRoomType);
			model.addAttribute("rooms", rooms);
			path = "/room/roomInp";
		}
		return path;
	}
	/**
	 * 房间管理界面修改房间情况为维修并添加维修记录
	 * @param room
	 * @return
	 */
	@RequestMapping("/addMaintain")
	public String addMaintain(Maintain maintain){
		String path = "error";	
		int roomSanitation = maintain.getMaintainStatus();
		int roomId = maintain.getRoomId();
		//修改房间状态为维修状态
		boolean b = roomServer.updateRoomSanitation(roomSanitation, roomId);
		if(b) {
			//如果修改房间状态成功，则添加房间维修记录
			boolean addMaintain = maintainServer.addMaintain(maintain);
			if(addMaintain) {
				//如果添加房间维修记录成功，查询房间类型Id并跳转到房间列表界面
				int roomTypeId = roomServer.showRoomTypeId(roomId);
				path = "redirect:/showAllRoom/"+roomTypeId;
			}		
		}
		return path;
	}
	/**
	   *房间管理界面 修改房间情况为空闲并修改对应的维修记录
	 * @param room
	 * @return
	 */
	@RequestMapping("/updateMaintain/{num}")
	public String updateMaintain(@PathVariable("num") int num,Maintain maintain){
		String path = "error";	
		int roomSanitation = maintain.getMaintainStatus();
		int roomId = maintain.getRoomId();
		//修改房间状态为空闲
		boolean b = roomServer.updateRoomSanitation(roomSanitation, roomId);
		if(b) {
			//如果修改房间状态成功，则查询房间的最新维修记录
			int maintainId = maintainServer.showMaintain(roomId);
			//修改该房间的最新一条维修记录
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("staffId", maintain.getStaffId());
			map.put("maintainFinishTime", maintain.getMaintainFinishTime());
			map.put("maintainStatus", maintain.getMaintainStatus());
			map.put("maintainResult", maintain.getMaintainResult());
			map.put("maintainId", maintainId);
			boolean addMaintain = maintainServer.updateMaintain(map);
			if(addMaintain) {
				//如果修改房间维修记录成功，查询房间类型Id并跳转到房间列表界面
				int roomTypeId = roomServer.showRoomTypeId(roomId);
				if(num == 0) {
					path = "redirect:/showAllRoom/"+roomTypeId;
				}else if(num == 1){
					path = "redirect:/showAllMaintain/1";
				}
				
			}else {
				//如果修改房间状态不成功，则修改房间状态为维修状态
				int roomSanitations = 2;
				boolean updateRoomSanitation = roomServer.updateRoomSanitation(roomSanitations, roomId);
				if(updateRoomSanitation) {
					int roomTypeId = roomServer.showRoomTypeId(roomId);
					if(num == 0) {
						path = "redirect:/showAllRoom/"+roomTypeId;
					}else if(num == 1){
						path = "redirect:/showAllMaintain/1";
					}
				}				
			}
		}
		return path;
	}
	
	/**
	 *后勤管理界面进行 清洁登记
	 * @param room
	 * @return
	 */
	@RequestMapping("/clean")
	public String clian(int roomSanitation,String roomNumber) {
		String path = "error";
		//通过房间号查询房间类型Id和房间Id
		Room room = roomServer.showRoomTypeIdAndRoomId(roomNumber);
		int roomId = room.getRoomId();
		int roomTypeId = room.getRoomTypeId();
		//修改房间状态为已打扫状态
		boolean b = roomServer.updateRoomSanitation(roomSanitation, roomId);
		if(b) {
			path = "redirect:/showAllRoom/"+roomTypeId;
		}
		return path;
	}
	
	/**
	 * 后勤管理界面通过房间号修改房间情况为维修并添加维修记录
	 * @param room
	 * @return
	 */
	@RequestMapping("/logisticsAddMaintain")
	public String logisticsAddMaintain(Maintain maintain,String roomNumber){
		String path = "error";	
		int roomSanitation = maintain.getMaintainStatus();
		//通过房间号查询房间类型Id和房间Id
		Room room = roomServer.showRoomTypeIdAndRoomId(roomNumber);
		int roomId = room.getRoomId();
		//修改房间状态为维修状态
		boolean b = roomServer.updateRoomSanitation(roomSanitation, roomId);
		if(b) {
			//如果修改房间状态成功，则添加房间维修记录
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("roomId",roomId);
			map.put("maintainStartTime", maintain.getMaintainStartTime());
			map.put("maintainCause", maintain.getMaintainCause());
			map.put("staffId", maintain.getStaffId());
			map.put("maintainStatus", maintain.getMaintainStatus());
			boolean addMaintain = maintainServer.logisticsAddMaintain(map);
			if(addMaintain) {
				path = "redirect:/showAllMaintain/1";
			}		
		}
		return path;
	}
	
	/**
	 * 修改房间状态
	 * @param room
	 * @return
	 */
	@RequestMapping("/updateRoomStatus")
	public String updateRoomStatus(int roomStatus,int roomId,int roomTypeId) {
		String path = "error";
		boolean b = roomServer.updateRoomStatus(roomStatus, roomId);
		if(b) {
			path = "redirect:/showAllRoom/"+roomTypeId;
		}
		return path;
	}
	
	/**
	 * 查询所有预订房间
	 * @param roomTypeId
	 * @return
	 */
	@RequestMapping(value = "/showRoomStruts/{op}/{roomTypeId}")
	public String showRoomStruts(@PathVariable("op") int op,@PathVariable("roomTypeId") int roomTypeId,Model model){
		String path = "error";
		List<Room> rooms = null;
		int roomStatus = 0;
		int roomSanitation =0;
		if(roomTypeId == 0) {
			if(op == 0) {
				//查询预订房间
				roomStatus = 1;
				rooms = roomServer.showRoomStruts(roomStatus,roomSanitation);
			}else if(op == 1) {
				//查询入住房间
				roomStatus = 2;
				rooms = roomServer.showRoomStruts(roomStatus,roomSanitation);
			}else if(op == 2) {
				//查询空闲房间
				roomStatus = 0;
				rooms = roomServer.showRoomStruts(roomStatus,roomSanitation);
			}else if(op == 3) {
				//查询未打扫房间
				roomSanitation = 1;
				rooms = roomServer.showRoomSanitation(roomSanitation);
			}else if(op == 4) {
				//查询维修中房间
				roomSanitation = 2;
				rooms = roomServer.showRoomSanitation(roomSanitation);
			}
		}else {
			if(op == 5) {
				//查询指定房间类型预订房间
				roomStatus = 1;
				rooms = roomServer.showRoomTypeStruts(roomStatus, roomSanitation, roomTypeId);
			}else if(op == 6) {
				//查询指定房间类型入住房间
				roomStatus = 2;
				rooms = roomServer.showRoomTypeStruts(roomStatus, roomSanitation, roomTypeId);
			}else if(op == 7) {
				//查询指定房间类型空闲房间
				roomStatus = 0;
				rooms = roomServer.showRoomTypeStruts(roomStatus, roomSanitation, roomTypeId);
			}else if(op == 8) {
				//查询指定房间类型未打扫房间
				roomSanitation = 1;
				rooms = roomServer.showRoomTypeSanitation(roomSanitation, roomTypeId);
			}else if(op == 9) {
				//查询指定房间类型维修中房间
				roomSanitation = 2;
				rooms = roomServer.showRoomTypeSanitation(roomSanitation, roomTypeId);
			}
		}
		if(rooms != null) {
			int countRoomType =  0; 
			int countReservationRoomType =0;
			int countCheckinRoomType = 0;
			int countFreeRoomType = 0;
			int countNotCleanedRoomType = 0;
			int countRepairRoomType = 0;
			if(roomTypeId == 0){
				countRoomType =  roomServer.countRoom();
				countReservationRoomType =roomServer.countReservation();
				countCheckinRoomType = roomServer.countCheckin();
				countFreeRoomType = roomServer.countFree();
				countNotCleanedRoomType = roomServer.countNotCleaned();
				countRepairRoomType = roomServer.countRepair();
				path = "/room/roomStruts";
			}else {
				countRoomType =  roomServer.countRoomType(roomTypeId); 
				countReservationRoomType =roomServer.countReservationRoomType(roomTypeId);
				countCheckinRoomType = roomServer.countCheckinRoomType(roomTypeId);
				countFreeRoomType = roomServer.countFreeRoomType(roomTypeId);
				countNotCleanedRoomType = roomServer.countNotCleanedRoomType(roomTypeId);
				countRepairRoomType = roomServer.countRepairRoomType(roomTypeId);
				path = "/room/roomTypeStruts";
			}
			model.addAttribute("countRoomType", countRoomType);
			model.addAttribute("countReservationRoomType", countReservationRoomType);
			model.addAttribute("countCheckinRoomType", countCheckinRoomType);
			model.addAttribute("countFreeRoomType", countFreeRoomType);
			model.addAttribute("countNotCleanedRoomType", countNotCleanedRoomType);
			model.addAttribute("countRepairRoomType", countRepairRoomType);
			model.addAttribute("roomTypeId", roomTypeId);
			model.addAttribute("rooms", rooms);			
		}
		return path;
	}
	
	/**
	 * 查询今日退房房间
	 * @return
	 */
	@RequestMapping("/showRoomNowCheckOut")
	public String showRoomNowCheckOut(Model model) {
		String path = "error";
		List<Room> rooms = roomServer.showRoomNowCheckOut();
		if(rooms != null) {
			int countRoomType =  roomServer.countRoom();
			int countReservationRoomType =roomServer.countReservation();
			int countCheckinRoomType = roomServer.countCheckin();
			int countFreeRoomType = roomServer.countFree();
			int countNotCleanedRoomType = roomServer.countNotCleaned();
			int countRepairRoomType = roomServer.countRepair();
			model.addAttribute("countRoomType", countRoomType);
			model.addAttribute("countReservationRoomType", countReservationRoomType);
			model.addAttribute("countCheckinRoomType", countCheckinRoomType);
			model.addAttribute("countFreeRoomType", countFreeRoomType);
			model.addAttribute("countNotCleanedRoomType", countNotCleanedRoomType);
			model.addAttribute("countRepairRoomType", countRepairRoomType);
			model.addAttribute("rooms", rooms);			
			path = "/room/roomStruts";
		}
		return path;
	}
}
