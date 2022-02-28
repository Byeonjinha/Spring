package kr.co.farmstory3.check.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.board.CommonService;

public class CheckUidService implements CommonService{
	
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		
		// 이미 로그인할때 CheckUidService객체로 요청 및 처리했지만 여기서 확실히 사용자가 있는지 체크하기위해서 똑같이 그냥 묶어서 처리해준다.
		
		String uid = req.getParameter("uid");
		int count = MemberDao.getInstance().selectCountUid(uid);
		JsonObject json = new JsonObject();
		json.addProperty("result", count); 
		return "json:"+json.toString();
		
		
		
	}

}
