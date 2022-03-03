package project.spring.TW.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieMapper {

	public int movieTime();

	public int movieAmount();

	public String[] movieNames();

}
