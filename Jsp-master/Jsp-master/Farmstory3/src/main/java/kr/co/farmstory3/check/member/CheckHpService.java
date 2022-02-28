package kr.co.farmstory3.check.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.board.CommonService;

public class CheckHpService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String hp = req.getParameter("hp");
		int count = MemberDao.getInstance().selectCountHp(hp);
		JsonObject json = new JsonObject();
		json.addProperty("result", count); 
		return "json:"+json.toString();
	}
}
