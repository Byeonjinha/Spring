package kr.co.farmstory3.check.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory3.dao.MemberDao;
import kr.co.farmstory3.service.board.CommonService;

public class CheckNickService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String nick = req.getParameter("nick");
		int count = MemberDao.getInstance().selectCountNick(nick);
		JsonObject json = new JsonObject();
		json.addProperty("result", count); 
		return "json:"+json.toString();
	}

}
