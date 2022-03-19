package project.spring.TW.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import project.spring.TW.domain.TicketingVO;

@Mapper
public interface MovieMapper {

	public int movieTime();

	public int movieAmount();

	public String[] movieNames();

	public int movieHallCount(String movieName);

	public String[] hallNumber(String movieName);

	public String[] movieStartTimes(@Param("movieName") String movieName, @Param("hallNumber")String hallNumber, @Param("nowTime")String nowTime, @Param("today") boolean today);

	public String[] movieEndTimes(@Param("movieName") String movieName, @Param("hallNumber")String hallNumber, @Param("nowTime")String nowTime, @Param("today") boolean today);

	public int hallSize(String hallNumber);

	public String movieEndTime(@Param("movieName") String movieName, @Param("movieStartTime")String movieStartTime,@Param("hallNumber") String hallNumber);

	public int reservation(TicketingVO vo);


}
