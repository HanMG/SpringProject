package com.java.purchase.service;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 :  PurchaseService
*/

@Component
public interface PurchaseService {
	//구매 페이지 연결
	public void purchaseInsert(ModelAndView mav);
	
	//구매하기
	public void purchaseInsertOk(ModelAndView mav);
	
	//구매내역
	public void purchaseList(ModelAndView mav);
	
	//구매내역 전체(관리자)
	public void purchaseListAll(ModelAndView mav);
	
	// 구매 상세 불러오기(관리자)
	public String purchaseDelete(ModelAndView mav);
	
	//구매 취소
	public String purchaseDeleteOk(ModelAndView mav);

	public void kakaoPay(ModelAndView mav);
	
}
