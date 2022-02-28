package kr.co.farmstory3.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;

public class DeleteCommentService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String seq = req.getParameter("seq");
		String parent = req.getParameter("parent");
		ArticleDao.getInstance().deleteComment(seq);
		ArticleDao.getInstance().updateCommentCountMinus(parent);
		return "redirect:/board/view.do?group="+group+"&cate="+cate+"&seq="+parent;
	}

}
