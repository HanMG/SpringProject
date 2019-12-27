package com.java.coupon.dao;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.coupon.dto.SearchFoodCodeDto;
import com.java.image.dto.ImageDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 : CouponDao 생성
 */

@Component
public interface CouponDao {
	//쿠폰상품 등록
	public String couponInsert(CouponDto couponDto);
	
	//식당코드 검색
	public List<SearchFoodCodeDto> searchFoodCode(String foodName);
	
	//쿠폰 리스트 카운트
	public int couponListCount();

	//쿠폰 리스트
	public List<CouponDto> couponList(int startRow, int endRow, Date today);
	
	//쿠폰 리스트(관리자)
	public List<CouponDto> couponListAdmin();
	
	//쿠폰 ajax로 리스트 불러오기
	public List<CouponDto> couponListAjax(int startRow, int endRow, Date today);
	
	//쿠폰 상세페이지
	public CouponDto couponRead(String couponCode);
	
	//쿠폰 수정
	public int couponUpdateOk(CouponDto couponDto);
	
	//쿠폰 이미지 수정
	public int couponImageUpdateOk(ImageDto imageDto);
	
	//쿠폰 삭제
	public int couponDeleteOk(String couponCode);
	
	//쿠폰 구매 연결
	public CouponDto purchaseSelect(String couponCode);

}
