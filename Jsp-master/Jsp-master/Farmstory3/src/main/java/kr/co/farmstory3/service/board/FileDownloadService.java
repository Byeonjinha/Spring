package kr.co.farmstory3.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.FileVo;

public class FileDownloadService implements CommonService{	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String fseq = req.getParameter("fseq");
		
		FileVo fvo = ArticleDao.getInstance().selectFile(fseq);
		ArticleDao.getInstance().updateFileDownload(fseq);
		req.setAttribute("fvo", fvo); 
		
		return "file:";
	}

}
