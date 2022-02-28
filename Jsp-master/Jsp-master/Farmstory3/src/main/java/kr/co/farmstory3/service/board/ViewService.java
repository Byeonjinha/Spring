package kr.co.farmstory3.service.board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;
import kr.co.farmstory3.vo.MemberVo;

public class ViewService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
			
			HttpSession sess = req.getSession();
			
			String seq = req.getParameter("seq");
			String group = req.getParameter("group");
			String cate = req.getParameter("cate");
			
			
			MemberVo sessMember = (MemberVo) sess.getAttribute("sessMember");
			
			if(sessMember == null) {
				
				return "redirect:/member/login.do?success=102";
				
			}else {
				ArticleVo article1 = new ArticleVo();
				
				ArticleDao dao = ArticleDao.getInstance();
				
				////  글작성 관련  ///////
				dao.updateArticleHit(seq);
				article1 = dao.selectArticle(seq);
				
				req.setAttribute("article", article1);
				
				///    댓글 관련    /////
				
				List<ArticleVo> comments = new ArrayList<>();
				comments = dao.selectComments(seq);
				req.setAttribute("comments",comments);
				
				
				req.setAttribute("group", group);
				req.setAttribute("cate", cate);
				return "/board/view.jsp";
		
			}
	}
}
