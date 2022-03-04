package project.spring.TW.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MovieMapper {

	public int movieTime();

	public int movieAmount();

	public String[] movieNames();

	public int movieHallCount(String movieName);

	public String[] hallNumber(String movieName);

	public String[] movieTimes(@Param("movieName") String movieName, @Param("hallNumber")String hallNumber);

}
