package com.gms.web.serviceImpl;

import java.util.List;

import com.gms.web.daoImpl.ArticleDAOImpl;
import com.gms.web.domain.ArticleBean;
import com.gms.web.service.ArticleService;
public class ArticleServiceImpl  implements ArticleService{
	public static ArticleServiceImpl instance=new ArticleServiceImpl();
	public static ArticleServiceImpl getInstance() {
		return instance;
	}
	
	private ArticleServiceImpl(){
		
	}
	@Override
	public String writeBoard(ArticleBean bean) {
		
		return ArticleDAOImpl.getInstance().insert(bean) ;
	}
	@Override
	public String countArticles() {
		
		return ArticleDAOImpl.getInstance().count();
	}

	@Override
	public List<ArticleBean> listAll() {
		// TODO Auto-generated method stub
		return  ArticleDAOImpl.getInstance().list();
	}

	@Override
	public ArticleBean findBySeq(int seq) {
		// TODO Auto-generated method stub
		return ArticleDAOImpl.getInstance().findSeq(seq);
	}

	@Override
	public List<ArticleBean> findById(String id) {
		
		return ArticleDAOImpl.getInstance().findId(id);
	}

	public String deleteBoard(int seq) {
		// TODO Auto-generated method stub
		return ArticleDAOImpl.getInstance().remove(seq);
	}
	@Override
	public String updateBoard(ArticleBean bean) {
		String rs=ArticleDAOImpl.getInstance().modify(bean);
		String msg = (rs.equals("1"))?"게시글 수정 성공":"게시글 수정 실패";
		return msg;
	}
	
	



}