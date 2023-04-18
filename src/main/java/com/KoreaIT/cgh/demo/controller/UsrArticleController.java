package com.KoreaIT.cgh.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.cgh.demo.service.ArticleService;
import com.KoreaIT.cgh.demo.util.Ut;
import com.KoreaIT.cgh.demo.vo.Article;
import com.KoreaIT.cgh.demo.vo.ResultData;

@Controller
public class UsrArticleController {

	@Autowired
	private ArticleService articleService;

	// 액션메서드
	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Integer> doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);
		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 글은 존재하지 않습니다", id), id);
		}

		articleService.modifyArticle(id, title, body);

		return ResultData.from("S-1", Ut.f("%d번 글을 수정 했습니다", id), id);
	}
	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Article> doDelete(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			//ResultData 1번실행
			return ResultData.from("F-1", Ut.f("%d번게시물은 존재하지 않습니다",id));
		}

		ResultData<Integer> doDeleteRd = articleService.deleteArticle(id);
		
		return ResultData.from(doDeleteRd.getResultCode(),doDeleteRd.getMsg(),article);
		

	}

	@RequestMapping("/usr/article/doWrite")
	@ResponseBody
	public ResultData<Article> doWrite(HttpSession httpsession,String title, String body) {
		boolean isLogined = false;
		int loginedMemberId = 0;
		
		if (httpsession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId =(int) httpsession.getAttribute("loginedMemberId");
		}
		
		if(isLogined == false) {
			return ResultData.from("F-A", "로그인 후 이용해주세요");
		}
		if(Ut.empty(title)) {
			return ResultData.from("F-1", "제목을 입력해주세요");
		}
		if(Ut.empty(body)) {
			return ResultData.from("F-2", "내용을 입력해주세요");
		}
		ResultData<Integer> writeArticleRd = articleService.writeArticle(loginedMemberId,title, body);
		
		int id =(int) writeArticleRd.getData1();

		Article article = articleService.getArticle(id);


		return ResultData.newData(writeArticleRd, article);
	}

	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData<List<Article>> getArticles() {
		List<Article> articles = articleService.articles();
		return ResultData.from("S-1", "Article list",articles);
	}

	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData<Article> getArticle(int id) {

		Article article = articleService.getArticle(id);

		if (article == null) {
			//ResultData 1번실행
			return ResultData.from("F-1", Ut.f("%d번게시물은 존재하지 않습니다",id));
		}
         //ResultData 2번 실행
		return ResultData.from("S-1", Ut.f("%d번게시물 입니다",id),article);
	}

}