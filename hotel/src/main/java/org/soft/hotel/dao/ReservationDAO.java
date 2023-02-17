package org.soft.hotel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.soft.hotel.model.Reservation;
import org.soft.hotel.querySql.ReservationQuery;



/**
 * 预订模块
 * @author Administrator
 *
 */
@Mapper
public interface ReservationDAO {

	/**
	 * 预订登记
	 * @param reservation
	 * @return
	 */
	@Insert("insert into reservation(roomId,roomTypeId,staffId,reservationName,reservationIdCard,reservationPhoneNumber,"
			+ "reservationTime,expectedTimeOfArrival,reservationOccupancyDays,reservationStatus,reservationForegift)"
			+ "value(#{roomId},#{roomTypeId},#{staffId},#{reservationName},#{reservationIdCard},#{reservationPhoneNumber},"
			+ "#{reservationTime},#{expectedTimeOfArrival},#{reservationOccupancyDays},#{reservationStatus},#{reservationForegift})")
	public boolean reservation(Reservation reservation);
	
	/**
	 * 删除预订记录 
	 * @param reservationId
	 * @return
	 */
	@Delete("delete from reservation where reservationId = #{reservationId}")
	public boolean deleteReservation(int reservationId);

	public boolean unsubscribe(int reservationId);
	
	/**
	 * 入住之后修改预订状态
	 * @param reservationId
	 * @return 
	 */
	@Update("update reservation set reservationStatus= 1 where reservationId = #{reservationId}")
	public boolean UpdateReservationStatus(int reservationId);
	
	
	/**
	 * 查看所有预订记录
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showAllReservation")
	public List<Reservation> showAllReservation(Map<String, Object> map);

	/**
	 * 通过身份证号,房间号,名字查询预定记录
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showReservationIdCard")
	public List<Reservation> showReservationIdCard(Map<String , Object> map);
	
	/**
	 * 查询预订记录总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from reservation")
	public int allPage();

	/**
	 * 查看输入框条件下的所有预订记录
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showInputReservation")
	public List<Reservation> showInputReservation(Map<String, Object> map);


	/**
	 * 查询输入框条件下的预订记录总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from reservation where roomId = #{roomId}")
	public int showInputAllPage(int roomId);


	/**
	 * 查询输入框名字的预定记录总页数
	 *
	 * @param id 名字
	 * @return int
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showInputNameAllPage")
	public int showInputNameAllPage(String id);

	/**
	 * 查看已入住预订记录
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showAllCheckInReservation")
	public List<Reservation> showAllCheckInReservation(Map<String, Object> map);
		
	/**
	 * 查询已入住预订记录总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from reservation where reservationStatus = 1")
	public int allCheckInPage();
	
	/**
	 * 查看预订中的预订记录
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showAllNoCheckInReservation")
	public List<Reservation> showAllNoCheckInReservation(Map<String, Object> map);
		
	/**
	 * 查询预订中的预订记录总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from reservation where reservationStatus = 0")
	public int allNoCheckInPage();
	
	/**
	 * 查看退订记录
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showAllUnsubscribeReservation")
	public List<Reservation> showAllUnsubscribeReservation(Map<String, Object> map);
	
	/**
	 * 查询退订记录总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from reservation where reservationStatus = 2")
	public int allUnsubscribePage();
	
	/**
	 * 查看未处理预订订单
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showUserReservation")
	public List<Reservation> showUserReservation(Map<String, Object> map);
	
	/**
	 * 查询未处理预订订单总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from reservation where reservationStatus = 3")
	public int allUserReservation();
	
	/**
	 * 通过房间id查询预订记录进行退订
	 * @param roomId
	 * @return
	 */
	@Select("select re.*,ro.roomNumber from reservation re inner join room ro on re.roomId=ro.roomId "
			+ "where re.roomId = #{roomId} order by reservationId desc limit 0,1")
	public Reservation showReservation(int roomId);
	
	/**
	 * 修改预订记录
	 * @param reservationId
	 * @return
	 */
	@Update("update reservation set reservationStatus =#{reservationStatus},"
			+ "unsubscribeForegift = #{unsubscribeForegift},staffId=#{staffId} "
			+ "where reservationId = #{reservationId}")
	public boolean UpdateReservation(Reservation reservation);

	@Update("update reservation set reservationStatus = 2,"
			+ "unsubscribeForegift = #{unsubscribeForegift},staffId=#{staffId} "
			+ "where reservationId = #{reservationId}")
	public boolean UnsubscribeReservation(Reservation reservation);

	/**
	 * 通过房间 id查询入住人信息
	 * @param roomId
	 * @return
	 */
	public Reservation showReservationUser(int roomId);
	
	/**
	 * 通过预订记录id查询预订信息
	 * @param roomId
	 * @return
	 */
	@SelectProvider(value = ReservationQuery.class,method = "showReservationDetail")
	public Reservation showReservationDetail(int reservationId);
	
	/**
	 * 修改预订记录的预订人信息
	 * @param reservationId
	 * @return
	 */
	@Update("update reservation set reservationName=#{reservationName},reservationIdCard=#{reservationIdCard},"
			+ "reservationPhoneNumber=#{reservationPhoneNumber},expectedTimeOfArrival=#{expectedTimeOfArrival},"
			+ "reservationOccupancyDays=#{reservationOccupancyDays},reservationForegift=#{reservationForegift}"
			+ " where reservationId = #{reservationId}")
	public boolean updateReservationUsers(Reservation reservation);
	
	/**
	 * 统计未处理的客户预订订单数
	 * @return
	 */
	@Select("select count(*) from reservation where reservationStatus = 3")
	public int countUserReservation();
}
