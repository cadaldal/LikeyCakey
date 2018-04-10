package com.dal.likeycakey.detailView.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dal.likeycakey.detailView.model.service.ProductBoardService;
import com.dal.likeycakey.detailView.model.vo.ProductBoard;
import com.dal.likeycakey.member.model.vo.BizWithMember;
import com.dal.likeycakey.member.model.vo.Member;


	// @Component 에서 Controller부분의 기본 설정을 추가한 자동 매핑 어노테이션 
	// @Component의 확장판
	@Controller
	public class DetailViewController {
		
		
		@Autowired
		private ProductBoardService pbService;
		
		@RequestMapping(value="detail.ca", method=RequestMethod.GET)
		public ModelAndView detailView(@RequestParam("pbNum") String pbNum, ModelAndView mv) {
			
			ProductBoard productDetail = selectProductDetail(pbNum);
			String tag[] = productDetail.getPbTag().split(",");
			BizWithMember productDetailBiz = selectProductDetailBiz(productDetail.getId());
			
			mv.addObject("productDetail", productDetail)
			.addObject("pbTag", tag)
			.addObject("productDetailBiz", productDetailBiz)
			.setViewName("detailView/detailView");
			
			return mv;
		}
		
		// 가게 이름, 가게 홈페이지 주소, 가게 주소, 가게 전화번호
		private BizWithMember selectProductDetailBiz(String id) {
			BizWithMember selectProductDetailBiz = pbService.selectProductDetailBiz(id);
			return selectProductDetailBiz;
		}

		// 소제목, 제목, 리뷰 별점 평균, 리뷰 개수, 소내용, 가격, 태그, 주의사항, 내용, 규격, 사이즈, 예약시 주의사항, 
		private ProductBoard selectProductDetail(String pbNum) {
			ProductBoard selectProductDetail = pbService.selectProductDetail(pbNum);
			return selectProductDetail;
		}

		@RequestMapping(value="custom.ca", method=RequestMethod.GET)
		public String customDetail(Model model) {
			
			return "detailView/customDetail";
		}
		
	}