package com.gms.web.service;

import java.util.List;

import com.gms.web.domain.ArticleBean;


public interface ArticleService {
	public String writeBoard(ArticleBean bean);
	public String countArticles();
	public List<ArticleBean> listAll();
	public ArticleBean findBySeq(int seq);
	public List<ArticleBean> findById(String id);
	
	public String deleteBoard(int seq);
	public String updateBoard(ArticleBean bean);
}
