package project.spring.TW.service;

import project.spring.TW.domain.DateVO;
import project.spring.TW.domain.TicketingVO;

public interface MainService {
	public DateVO[] calcDate();

	public TicketingVO[] ticketingInfo(DateVO vo);

	public TicketingVO[] movieTime(int month, int day, boolean today);

	public boolean today(int month, int day);

	
}
