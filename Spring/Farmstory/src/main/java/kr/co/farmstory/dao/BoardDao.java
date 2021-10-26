package kr.co.farmstory.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.farmstory.vo.ArticleVo;
import kr.co.farmstory.vo.FileVo;

@Repository
public interface BoardDao {
	
	public int insertArticle(ArticleVo vo);
	public int insertComment(ArticleVo vo);
	
	public void insertFile(FileVo vo);
	
	public ArticleVo selectArticle(int seq);
	public ArticleVo selectComment(int seq);
	public List<ArticleVo> selectArticles(int start , String cate);
	public List<ArticleVo> selectComments(int start);
	
	public int selectCountTotal(String cate);
	public FileVo selectFile(int fseq);
	
	
	public int updateArticle(ArticleVo vo);
	public void updateFileDownload(int fseq);
	public void updateHit(int seq);
	public void updateComment(String content);
	public void updateCommentCountPlus(int seq);
	public void updateCommentCountMinus(int seq);
	
	
	public void deleteArticle(int seq);
	
}
