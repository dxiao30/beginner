package org.soft.hotel.server;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.soft.hotel.dao.ReservationDAO;
import org.soft.hotel.model.Reservation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 预订模块
 * @author Administrator
 *
 */
@Controller("ReservationServer")
public class ReservationServer {

	@Autowired
	private ReservationDAO reservationDAO;
	
	/**
	 * 预订登记
	 * @param reservation
	 * @return
	 */
	public boolean reservation(Reservation reservation) {
		boolean b = reservationDAO.reservation(reservation);
		return b;
	}
	
	/**
	 * 删除预订记录
	 * @param reservationId
	 * @return
	 */
	public boolean deleteReservation(int reservationId) {
		boolean b = reservationDAO.deleteReservation(reservationId);
		return b;
	}
	
	/**
	 * 入住之后修改预订状态
	 * @param reservationId
	 * @return
	 */
	public boolean UpdateReservationStatus(int reservationId) {
		boolean b = reservationDAO.UpdateReservationStatus(reservationId);
		return b;
	}
	
	
	/**
	 * 查看所有预订记录
	 * @return
	 */
	public List<Reservation> showAllReservation(Map<String, Object> map){
		List<Reservation> reservations = reservationDAO.showAllReservation(map);
		return reservations;
	}
	
	/**
	 * 查询预订记录总页数
	 * @param size
	 * @return
	 */
	public int allPage() {
		int allPageNum = reservationDAO.allPage();
		return allPageNum;
	}
	
	/**
	 * 查看输入框条件下的所有预订记录
	 * @return
	 */
	public List<Reservation> showInputReservation(Map<String, Object> map){
		List<Reservation> reservations = reservationDAO.showInputReservation(map);
		return reservations;
	}


	/**
	 * 查询某个人的预定记录
	 */
	public List<Reservation> showReservationIdCard(Map<String, Object> map) {
		List<Reservation> reservations = reservationDAO.showReservationIdCard(map);
		return reservations;
	}

	/**
	 * 查询输入框条件下的预订记录总页数
	 * @param
	 * @return
	 */
	public int showInputAllPage(int roomId) {
		int allPageNum = reservationDAO.showInputAllPage(roomId);
		return allPageNum;
	}


	/**
	 * 查询输入框名字条件下的预定记录总页数
	 *
	 * @param name 名字
	 * @return allPageNum 总页数
	 */
	public int showInputNameAllPage(String id){
		int allPage = reservationDAO.showInputNameAllPage(id);
		return allPage;
	}

	/**
	 * 查看已入住预订记录
	 * @return
	 */
	public List<Reservation> showAllCheckInReservation(Map<String, Object> map){
		List<Reservation> reservations = reservationDAO.showAllCheckInReservation(map);
		return reservations;
	}
		
	/**
	 * 查询未已住预订记录总页数
	 * @param size
	 * @return
	 */
	public int allCheckInPage() {
		int allCheckInPageNum = reservationDAO.allCheckInPage();
		return allCheckInPageNum;
	}
	
	/**
	 * 查看预订中的预订记录
	 * @return
	 */
	public List<Reservation> showAllNoCheckInReservation(Map<String, Object> map){
		List<Reservation> reservations = reservationDAO.showAllNoCheckInReservation(map);
		return reservations;
	}
		
	/**
	 * 查询预订中的预订记录总页数
	 * @param size
	 * @return
	 */
	public int allNoCheckInPage() {
		int allNoCheckInPageNum = reservationDAO.allNoCheckInPage();
		return allNoCheckInPageNum;
	}
	
	/**
	 * 查看退订记录
	 * @return
	 */
	public List<Reservation> showAllUnsubscribeReservation(Map<String, Object> map){
		List<Reservation> reservations = reservationDAO.showAllUnsubscribeReservation(map);
		return reservations;
	}
	
	/**
	 * 查询退订记录总页数
	 * @param size
	 * @return
	 */
	public int allUnsubscribePage() {
		int allUnsubscribePageNum = reservationDAO.allUnsubscribePage();
		return allUnsubscribePageNum;
	}
	
	/**
	 * 查看未处理预订订单
	 * @return
	 */
	public List<Reservation> showUserReservation(Map<String, Object> map){
		List<Reservation> reservations = reservationDAO.showUserReservation(map);
		return reservations;
	}
	
	/**
	 * 查询未处理预订订单总页数
	 * @param size
	 * @return
	 */
	public int allUserReservation() {
		int allUserReservation = reservationDAO.allUserReservation();
		return allUserReservation;
	}
	
	/**
	 * 通过房间id查询预订记录进行退订
	 * @param roomId
	 * @return
	 */
	public Reservation showReservation(int roomId) {
		Reservation reservation = reservationDAO.showReservation(roomId);
		return reservation;
	}
	
	/**
	 * 修改预订记录进行退订
	 * @param reservationId
	 * @return
	 */
	public boolean UpdateReservation(Reservation reservation) {
		boolean b = reservationDAO.UnsubscribeReservation(reservation);
		int reservationId = reservation.getReservationId();
		System.out.println(reservationId);
		return b;
	}

	/**
	 * 修改预订记录为退订
	 * @param reservationId
	 * @return
	 */
	public boolean unsubscribe(int reservationId){
		boolean  b = reservationDAO.unsubscribe(reservationId);
		return b;
	}

	/**
	 * 通过房间 id查询入住人信息
	 * @param roomId
	 * @return
	 */ 
	public Reservation showReservationUser(int roomId) {
		Reservation reservation = reservationDAO.showReservationUser(roomId);
		return reservation;
	}
	
	/**
	 * 通过预订记录id查询预订信息
	 * @param roomId
	 * @return
	 */
	public Reservation showReservationDetail(int reservationId) {
		Reservation reservation = reservationDAO.showReservationDetail(reservationId);
		return reservation;
	}
	
	/**
	 * 修改预订记录的预订人信息
	 * @param reservationId
	 * @return
	 */
	public boolean updateReservationUsers(Reservation reservation) {
		boolean b = reservationDAO.updateReservationUsers(reservation);
		return b;
	}
	
	/**
	 * 统计未处理的客户预订订单数
	 * @return
	 */
	public int countUserReservation() {
		int countUserReservation = reservationDAO.countUserReservation();
		return countUserReservation;
	}
}
