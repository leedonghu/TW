package project.spring.TW.service;

import project.spring.TW.domain.DateVO;
import project.spring.TW.domain.TicketingVO;

public interface MainService {
	public DateVO[] calcDate();

	public TicketingVO[] ticketingInfo(DateVO vo);
}
