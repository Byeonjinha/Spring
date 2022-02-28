package kr.co.farmstory3.service.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory3.dao.ArticleDao;
import kr.co.farmstory3.vo.ArticleVo;
import kr.co.farmstory3.vo.MemberVo;

public class WriteService implements CommonService{
	 private String path = null;
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		HttpSession sess = req.getSession();
		MemberVo sessMember = (MemberVo) sess.getAttribute("sessMember");
		ArticleVo av = null;
		if(sessMember == null) {
			
			return "redirect:/member/login.do?success=103";
		}
		else if(req.getMethod().equals("GET")) {
			String group = req.getParameter("group");
			String cate = req.getParameter("cate");
			req.setAttribute("group", group);
			req.setAttribute("cate", cate);
			
			return "/board/write.jsp";
		}
		
		else {
			MultipartRequest mReq = null;
			try {
				path = req.getServletContext().getRealPath("/file"); // 而⑦뀓�뒪�듃 寃쎈줈�뒗 �떆�뒪�뀥�뿉�꽌 而⑦뀓�뒪�듃 寃쎈줈�씠�떎 
				int maxSize = 1024 * 1024 * 10;// 理쒕� �뙆�씪 �뿀�슜 �겕湲� 10MB
				mReq = new MultipartRequest(req, path, maxSize, "UTF-8", new DefaultFileRenamePolicy()); // �뙆�씪 �씠由� 蹂�寃� 媛앹껜源뚯� �꽔�뼱以��떎
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			String mgroup = mReq.getParameter("group");
			String mcate = mReq.getParameter("cate");
			String uid = mReq.getParameter("uid"); // �꽭�뀡�뿉 �엳�뒗 uid媛� 湲��옉�꽦�옄�씠�떎 
			
			String title = mReq.getParameter("title");
			String content = mReq.getParameter("content");
			String fname = mReq.getFilesystemName("fname"); // �뙆�씪�� �뙆�씪�떆�뒪�뀥 �씠由꾩쑝濡� 諛쏆븘�삩�떎 
			
			
		
			
			String regip = req.getRemoteAddr();
			av = new ArticleVo();
			av.setTitle(title);
			av.setContent(content);
			av.setFile(fname == null ? 0: 1);
			av.setCate(mcate);
			av.setUid(uid);
			av.setRegip(regip);
			int seq = ArticleDao.getInstance().insertArticle(av);// 湲�踰덊샇瑜� 諛쏆븘�꽌 �뙆�씪 �뀒�씠釉붿뿉 ���옣�븷寃껋씠�떎 洹� 湲�踰덊샇媛� �뙆�씪�뀒�씠釉붿쓽 遺�紐⑦븘�뱶媛믪씠�떎 
			
			
			if(fname != null) {
				String newName = renameFile(fname,uid); // �깉濡쒖슫 �씠由꾩쓣 由ы꽩諛쏄퀬 
				ArticleDao.getInstance().insertFile(seq, fname,newName); // �뙆�씪�뀒�씠釉붿뿉 媛숈씠 ���옣�븳�떎 �썝�옒�씠由꾧낵 �깉濡쒖슫�씠由꾩쑝濡� 
			}
			
			return "redirect:/board/list.do?group="+mgroup+"&cate="+mcate;
		}
	}//requestProc end
	// �쟻�젅�븯寃� 紐⑤뱢�솕�빐以��떎 硫��떚�뙆�듃 由ъ��뒪�듃媛앹껜瑜� �깮�꽦�븯�뒗 怨쇱젙�쓣 
	
	public String renameFile(String fname, String uid) { // �뙆�씪 �씠由꾩쓣 洹몃�濡� �궗�슜�븯吏��븡怨� 蹂�寃쏀빐�꽌 ���옣 
		
			int i = fname.lastIndexOf("."); // �뮘�뿉�꽌 .�쓣 李얠븘�꽌 �씤�뜳�뒪瑜� 諛섑솚 => Sample.txt�뿉�꽌�뒗 6�씠�떎 
			String ext = fname.substring(i); //  �솗�옣�옄瑜� �옄由� �씤�뜳�뒪 6遺��꽣 �걹源뚯� 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_"); // _�뮘�뿉�뒗 �븘�씠�뵒�� �솗�옣媛� 李⑤�濡� 遺숇뒗�떎!!!!!
			String now = sdf.format(new Date());
			String newName = now+uid+ext; // �깉濡쒖슫 �뙆�씪�씠由꾩쓣 留뚮뱺�떎 
			File oriFile = new File(path+"/"+fname);
			File newFile = new File(path+"/"+ newName); // �씠 �뙆�씪�씠由꾩� 媛��긽�쓽 �뙆�씪�씠由꾩씠怨� �썝�옒 �뙆�씪�씠由꾩쓣 �깉濡쒖슫 �뙆�씪�씠由꾩쑝濡� 蹂�寃쏀빐�빞�븳�떎
			oriFile.renameTo(newFile);
			// �븯�굹�쓽 硫붿꽌�뱶�뒗 �븯�굹�쓽 湲곕뒫留� �젙�쓽�븯�뒗 寃껋씠 醫뗫떎 洹몃옒�꽌 �뙆�씪 �뀒�씠釉붿뿉 �엯�젰�� �뵲濡� �젙�쓽�븳�떎 
			return newName;
			
	}
}
