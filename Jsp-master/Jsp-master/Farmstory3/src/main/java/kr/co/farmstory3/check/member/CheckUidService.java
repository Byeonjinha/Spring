package kr.co.farmstory3.check.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.board.CommonService;

public class CheckUidService implements CommonService{
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		
		// �̹� �α����Ҷ� CheckUidService��ü�� ��û �� ó�������� ���⼭ Ȯ���� ����ڰ� �ִ��� üũ�ϱ����ؼ� �Ȱ��� �׳� ��� ó�����ش�.
		
		String uid = req.getParameter("uid");
		int count = MemberDao.getInstance().selectCountUid(uid);
		JsonObject json = new JsonObject();
		json.addProperty("result", count); 
		return "json:"+json.toString();
		
		
		
	}

}
