package kr.co.farmstory3.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.service.board.CommonService;
import kr.co.farmstory3.vo.ArticleVo;

public class IndexService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String success = req.getParameter("success");
		
		
		
		List<ArticleVo> grow_articles = ArticleDao.getInstance().selectCroptalk("grow");
		
		List<ArticleVo> school_articles = ArticleDao.getInstance().selectCroptalk("school");
		
		List<ArticleVo> story_articles = ArticleDao.getInstance().selectCroptalk("story");
		
		List<ArticleVo> notice_articles = ArticleDao.getInstance().selectCommunity("notice");
		
		List<ArticleVo> qna_articles = ArticleDao.getInstance().selectCommunity("qna");
		
		List<ArticleVo> faq_articles = ArticleDao.getInstance().selectCommunity("faq");
		
		
		req.setAttribute("grow_articles", grow_articles);
		
		req.setAttribute("school_articles", school_articles);
		
		req.setAttribute("story_articles", story_articles);
		
		req.setAttribute("notice_articles", notice_articles);
		
		req.setAttribute("qna_articles", qna_articles);
		
		req.setAttribute("faq_articles", faq_articles);
		
		req.setAttribute("success", success);
		
		return "/index.jsp";
	}
}
