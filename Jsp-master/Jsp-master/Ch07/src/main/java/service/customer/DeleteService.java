package service.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import dao.MemberDao;
import model.CommonService;

public class DeleteService  implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String custid = req.getParameter("custid");
		CustomerDao.getInstance().deleteCustomer(custid);
		
		return "redirect:/customer/list.do";
	}

}
