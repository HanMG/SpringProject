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
	public void purchaseListAll(ModelAndView mav);
}
