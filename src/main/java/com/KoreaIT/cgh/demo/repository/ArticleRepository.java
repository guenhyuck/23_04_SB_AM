package com.KoreaIT.cgh.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.cgh.demo.vo.Article;

@Mapper
public interface ArticleRepository {
	public void writeArticle(int memberId, String title, String body);

	public List<Article> getArticles();

	public Article getArticle(int id);

	public void deleteArticle(int id);

	public void modifyArticle(int id, String title, String body);

	public int getLastInsertId();

}