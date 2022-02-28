package kr.co.farmstory3.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;
import kr.co.farmstory3.vo.MemberVo;

public class ListService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		
		HttpSession sess = req.getSession();
		
		
		MemberVo sessMember = (MemberVo) sess.getAttribute("sessMember");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		
			// �럹�씠吏� 泥섎━
			
		String pg = req.getParameter("pg"); 
		
		//紐⑤뱢�솕 �떆�궎�옄 
		
		int currentPage = getCurrentPage(pg); 
		int total = ArticleDao.getInstance().selectCountTotal(cate); // 珥� 湲��쓽 媛��닔瑜� 援ы븯湲� �쐞�빐 荑쇰━臾몄쓣 �뜲�씠�꽣踰좎씠�뒪濡� �궇�젮�꽌 寃곌낵媛믪쓣 媛��졇�삩�떎
		int start = getLimitStart(currentPage);  // �럹�씠吏� �꽆�뼱媛�硫� 10 20 30......遺��꽣 �떆�옉 => 湲��쓣 10媛쒖뵫 �걡�뼱�꽌 媛��졇�삤湲� �쐞�빐 蹂��닔瑜� �꽕�젙�븳�떎 
		int pageStartNum = getPageStartNum(total,start); // 珥앷갗�닔�뿉�꽌  start 踰덊샇瑜� 鍮쇰㈃ 媛� �럹�씠吏��뿉�꽌 �떆�옉�븯�뒗 踰덊샇瑜� 援ы븷 �닔 �엳�떎.
		// 珥� 媛��닔媛� 100媛쒕㈃ 100- 0 = 100踰덈��꽣 �떆�옉踰덊샇媛� �뀑�똿�릺怨� 100-10=90踰덈��꽣 �떆�옉踰덊샇媛� �뀑�똿�맂�떎 100-20=80踰덈��꽣 �떆�옉踰덊샇媛� �뀑�똿�맂�떎.
		int lastPageNum = getLastPageNum(total); // 珥� 媛��닔�뿉�꽌 留덉�留� �럹�씠吏�瑜� 援ы븷 �닔 �엲�뵲 10媛쒖뵫 �굹�닠�꽌 �뼥�뼱吏��뒓�깘 �븘�땲�깘留� 泥댄겕�븯硫대맂�떎 
		
		List<ArticleVo> articles = ArticleDao.getInstance().selectArticles(start,cate);
		
		int[] groups = getPageGroup(currentPage,lastPageNum);
		
		/////////////////////////////////////////////////////////////////////////
		// 遺덈윭�삩 湲��뱾�쓣 由ъ��뒪�듃 媛앹껜�뿉 ���옣�븳�떎 
		
		
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum); // 留덉�留� �럹�씠吏��쓽  湲� 踰덊샇瑜� 由ъ뒪�듃 酉고럹�씠吏�濡� �쟾�떖�븳�떎 
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("groups", groups);
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		return"/board/list.jsp";
		
	}
	public int getCurrentPage(String pg) {    // �쁽�옱 �럹�씠吏� 踰덊샇瑜� 媛��졇�삩�떎 
		if(pg == null) {
			pg = "1";
		}
		return Integer.parseInt(pg);
	}
	public int getLastPageNum(int total) {     // 留덉�留� �럹�씠吏� 踰덊샇瑜� 媛��졇�삩�떎 
		int lastPageNum = 0;
		if(total % 10 == 0){ // 珥앷갗�닔媛� 10媛쒖뵫 �굹�닠�꽌  �뼥�뼱吏��뒗 寃쎌슦 留덉�留� �럹�씠吏��뒗 紐ル쭔 諛섑솚 
			lastPageNum = total / 10;
		}else{ // 珥� 媛��닔媛� 10�뵫 �굹�닠�꽌 �븞�뼥�뼱吏��뒗 寃쎌슦 留덉�留� �럹�씠吏��뒗 紐レ뿉�떎媛� +1 諛섑솚 
			lastPageNum = total / 10 + 1;
		}	
		return lastPageNum;
	}
	public int getLimitStart(int currentPage) {  // �쁽�옱 �럹�씠吏��뿉�꽌 異쒕컻�븯�뒗 踰덊샇瑜� 援ы븯湲� �쐞�빐 start瑜� �뀑�똿�븳�떎 0,10,20 �씠硫� 荑쇰━臾몄뿉�꽌 limit(0,10)   limit(10,10) limit(20,10).......
		// 泥섏쓬遺��꽣 10媛� 洹몃떎�쓬 10踰덉㎏ �젙蹂� 10媛� 洹몃떎�쓬 20踰덉㎏ 10媛�  洹몃떎�쓬 30踰덉㎏ 10媛�
		
		return (currentPage - 1) * 10;
		
	}
	public int getPageStartNum(int total,int start) {   // 媛� �럹�씠吏��쓽 �떆�옉踰덊샇瑜� 援ы븯湲� �쐞�븳 硫붿꽌�뱶 
		return (total - start) + 1;  // 珥� 媛��닔�뿉�꽌 �떆�옉�븯�뒗 媛� 踰덊샇瑜� 鍮쇨퀬�굹�꽌 +1�쓣 �빐二쇱뼱�빞 0踰덉씠 �븞留뚮뱾�뼱吏꾨떎 
	}
	
	
	public int[]  getPageGroup(int currentPage, int lastPageNum) { // 諛섑솚媛믪씠 �뿬�윭媛쒖씪寃쎌슦 諛곗뿴�뿉 �떞�븘�꽌 由ы꽩 
		
		int groupCurrent = (int)Math.ceil(currentPage / 10.0); // 1~10�럹�씠吏�源뚯� 洹몃９ 1踰� // 11�럹�씠吏�遺��꽣 20�럹�씠吏� 洹몃９2踰� // 21�럹�씠吏�遺��꽣 30�럹�씠吏� 洹몃９ 3踰� 
		int groupStart = (groupCurrent - 1) * 10 + 1;
		int groupEnd = groupCurrent * 10;
		
		if(groupEnd > lastPageNum){
			groupEnd = lastPageNum;
		}
		
		int[] groups = {groupStart,groupEnd};
		
		return groups;
	}

}
