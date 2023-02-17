package org.soft.hotel.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.soft.hotel.model.Checkin;
import org.soft.hotel.querySql.CheckInQuery;

/**
 * 入住模块
 * @author Administrator
 *
 */
@Mapper
public interface CheckInDAO {

	/**
	 * 入住登记
	 * @param checkin
	 * @return
	 */
	@Insert("insert into checkin(roomTypeId,roomId,staffId,usersId,clientId,checkinTime,departureTime,checkinDay,checkinForegift) "
			+ "value(#{roomTypeId},#{roomId},#{staffId},#{usersId},#{clientId},#{checkinTime},#{departureTime},#{checkinDay},#{checkinForegift})")
	public boolean checkIn(Checkin checkin);
	
	/**
	 * 查询房间的入住信息
	 * @param roomId
	 * @return
	 */
	@SelectProvider(value = CheckInQuery.class,method = "showCheckIn")
	public Checkin showCheckIn(int roomId);
	
	/**
	 * 删除入住记录
	 * @param checkinId
	 * @return
	 */
	public boolean checkInDelete(int checkinId);
	
	/**
	 * 查询所有会员入住记录
	 * @param nowPageRowNum
	 * @param size
	 * @return
	 */
	@SelectProvider(value = CheckInQuery.class,method = "showAllUsersCheckIn")
	public List<Checkin> showAllUsersCheckIn(Map<String, Object> map);
	
	/**
	 * 查询会员入住记录 总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from checkIn where usersId > 0")
	public int allUsersPage();
	
	/**
	 * 查询输入框条件下所有会员入住记录
	 * @param nowPageRowNum
	 * @param size
	 * @return
	 */
	@SelectProvider(value = CheckInQuery.class,method = "showInputUsersCheckIn")
	public List<Checkin> showInputUsersCheckIn(Map<String, Object> map);
	
	/**
	 * 查询输入框条件下会员入住记录总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from checkIn where usersId > 0 and roomId = #{roomId}")
	public int inputUsersPage(int roomId);
		
	/**
	 * 查询所有普通客户入住记录
	 * @param nowPageRowNum
	 * @param size
	 * @return
	 */
	@SelectProvider(value = CheckInQuery.class,method = "showAllClientCheckIn")
	public List<Checkin> showAllClientCheckIn(Map<String, Object> map);

	/**
	 * 查询普通客户入住记录 总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from checkIn where clientId > 0")
	public int allClientPage();
	
	/**
	 * 查询输入框条件下所有普通客户入住记录
	 * @param nowPageRowNum
	 * @param size
	 * @return
	 */
	@SelectProvider(value = CheckInQuery.class,method = "showInputClientCheckIn")
	public List<Checkin> showInputClientCheckIn(Map<String, Object> map);

	/**
	 * 查询输入框条件下普通客户入住记录 总页数
	 * @param size
	 * @return
	 */
	@Select("select count(*) from checkIn where clientId > 0 and roomId = #{roomId}")
	public int inputClientPage(int roomId);
	
	/**
	 * 通过房间id查询入住记录id
	 * @param roomId
	 * @return
	 */
	@Select("select checkinId from checkin where roomId=#{roomId} limit 1")
	public int showCheckinId(int roomId);
	
	/**
	 * 续住登记
	 * @param checkin
	 * @return
	 */
	@Update("update checkin set departureTime=#{departureTime},checkinDay=#{checkinDay},"
			+ "checkinForegift=(checkinForegift+#{checkinForegift}),staffId=#{staffId} where checkinId = #{checkinId}")
	public boolean Continued(Checkin checkin);
	
	/**
	 * 统计指定房间类型的日入住房间
	 * @param roomTypeId
	 * @return
	 */
	@Select("select count(*) from checkIn where roomTypeId = #{roomTypeId} and #{dataNum}=SUBSTR(checkInTime,1,10)")
	public int countCheckinRoomTypeData(int roomTypeId,String dataNum);
	
	/**
	 * 统计指定房间类型的周入住房间
	 * @param roomTypeId
	 * @return
	 */
	@Select("select count(*) from checkIn where roomTypeId=#{roomTypeId} and week(checkinTime) = week(curdate());")
	public int countCheckinRoomTypeWeek(int roomTypeId);
	
	/**
	 * 统计指定房间类型的年入住房间
	 * @param roomTypeId
	 * @return
	 */
	@Select("select count(*) from checkIn where roomTypeId=#{roomTypeId} and year(checkInTime)-#{nowYearNum}=0")
	public int countCheckinRoomTypeNowYear(int roomTypeId,int nowYearNum);
	
	/**
	 * 统计指定房间类型的指定起止日期下的入住房间
	 * @param map
	 * @return
	 */
	@SelectProvider(value = CheckInQuery.class,method = "countCheckInRoomTtypeStartAndStopDates")
	public int countCheckInRoomTtypeStartAndStopDates(Map<String, Object> map);
	
	/**
	 * 统计指定房间类型的指定年月下的入住房间
	 * @param roomTypeId
	 * @return
	 */
	@Select("select count(*) from checkIn where roomTypeId = #{roomTypeId} and SUBSTR(checkInTime,1,7)=#{yearAndDates}")
	public int countCheckinRoomTypeYearAndDates(int roomTypeId,String yearAndDates);
	
	/**
	 * 统计指定房间类型的指定年份下的入住房间
	 * @param roomTypeId
	 * @return
	 */
	@Select("select count(*) from checkIn where roomTypeId = #{roomTypeId} and SUBSTR(checkInTime,1,4)=#{yearNum}")
	public int countCheckinRoomTypeYear(int roomTypeId,String yearNum);
	
	/**
	 * 统计今日退房房间数
	 * @return
	 */
	@Select("select count(r.roomId) from room r,checkIn c where r.roomId = c.roomId and r.roomStatus = 2 and r.roomSanitation = 0"
			+ " and SUBSTR(c.DepartureTime,1,10)=SUBSTR(now(),1,10)")
	public int countNowCheckOut();
}
