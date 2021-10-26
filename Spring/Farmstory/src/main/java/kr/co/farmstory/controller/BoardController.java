package kr.co.farmstory.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.farmstory.service.BoardService;
import kr.co.farmstory.vo.ArticleVo;
import kr.co.farmstory.vo.FileVo;
import kr.co.farmstory.vo.MemberVo;
import lombok.Value;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	@GetMapping("/board/list")
		public String list(String group, String cate, Model model,String pg) {
		int currentPage = service.getCurrentPage(pg, cate);
		int start = service.getLimitStart(currentPage);
		List<ArticleVo> articles = service.selectArticles(start,cate);
		
		int total = service.selectCountTotal(cate);
		int pageStartNum = service.getPageStartNum(total, start);
		int lastPageNum = service.getLastPageNum(total);
		int groups[] = service.getPageGroup(currentPage, lastPageNum);
		
		model.addAttribute("articles", articles);
		model.addAttribute("pageStartNum", pageStartNum);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPageNum", lastPageNum);
		model.addAttribute("groups", groups);
		
		model.addAttribute("group", group);
		model.addAttribute("cate",cate);
		
		return "/board/list";
	}
	
	@GetMapping("/board/view")
	public String view(String group, String cate,int seq, Model model) {
		model.addAttribute("group", group);
		model.addAttribute("cate",cate);
		
		
		ArticleVo vo = service.selectArticle(seq);
		model.addAttribute(vo);
		service.updateHit(seq);
		List<ArticleVo> comments = service.selectComments(seq);
		model.addAttribute("comments", comments);
		return "/board/view";
	}
	@PostMapping("/board/view")
	public String Comment(HttpServletRequest req, ArticleVo vo) {
		String group = vo.getGroup();
		String cate = vo.getCate();
		int seq = vo.getSeq();
		service.insertComment(vo);
		service.updateCommentCountPlus(seq);
		return "redirect:/board/view?group="+group+"&cate="+cate+"&seq="+seq;
	}
	
	
	@GetMapping("/board/write")
	public String write(String group, String cate, Model model) {
		model.addAttribute("group", group);
		model.addAttribute("cate",cate);
		return "/board/write";
	}
	
	@PostMapping("/board/write")
	public String write(HttpServletRequest req, ArticleVo vo) {
		
		String regip = req.getRemoteAddr();
		vo.setRegip(regip);
		String cate = vo.getCate();
		String group = vo.getGroup();
		// 작성글 Insert
		int seq = 0;	

		if(vo.getFname().isEmpty()) {
			// 파일을 첨부 안했을때
			vo.setFile(0);
			seq = service.insertArticle(vo);
		}else {
			// 파일을 첨부 했을때
			vo.setFile(1);
			seq = service.insertArticle(vo);
			FileVo fvo = service.fileUpload(vo.getFname(), seq);
			service.insertFile(fvo);
		}
		
		return "redirect:/board/list?group="+group+"&cate="+cate;
	}
	
	@GetMapping("/fileDownload")
	public void fileDownload(int fseq, HttpServletResponse resp) {
		service.updateFileDownload(fseq);
		System.out.println("다운로드됨"+fseq);
		FileVo fileVo =service.selectFile(fseq);
	    service.fileDownload(resp, fileVo);
	}
	
	@GetMapping("/board/modify")
	public String modify(int seq, Model model,String group,String cate) {
		model.addAttribute("group", group);
		model.addAttribute("cate",cate);
		
		ArticleVo vo = service.selectArticle(seq);
		model.addAttribute(vo);		
		return "/board/modify";
	}
	
	@PostMapping("/board/modify")
	public String modify(HttpServletRequest req, ArticleVo vo,String group,String cate,Model model) {
		
		int seq = vo.getSeq();
		model.addAttribute("group", group);
		model.addAttribute("cate",cate);
		if(vo.getFname().isEmpty()) {
			// 파일을 첨부 안했을때
			vo.setFile(0);
			seq = service.updateArticle(vo);
		}else {
			// 파일을 첨부 했을때
			vo.setFile(1);
			seq = service.updateArticle(vo);
			FileVo fvo = service.fileUpload(vo.getFname(), seq);
			service.insertFile(fvo);
		}
		
		return "redirect:/board/view?group="+group+"&cate="+cate+"&seq="+seq;
	}
	
	
	
	@GetMapping("/delete")
	public String delete(int seq,String group,String cate) {
		service.deleteArticle(seq);
		return "redirect:/board/list?group="+group+"&cate="+cate;
	}
	
	@PostMapping("/delete")
	public String delete(HttpServletRequest req, ArticleVo vo) {

		return "redirect:/list";
	}
	
	
	@GetMapping("/deleteComment")
	public String deleteComment(int seq, Model model,String group,String cate) {
		ArticleVo vo = service.selectArticle(seq);
		int parent = vo.getParent();
		model.addAttribute(vo);		
		service.deleteArticle(seq);
		service.updateCommentCountMinus(parent);
		return "redirect:/board/view?group="+group+"&cate="+cate+"&seq="+parent;
	}
	
	
}
