package com.java.purchase.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.member.dto.MemberDto;
import com.java.purchase.dto.PurchaseDto;
import com.java.purchase.dto.PurchaseListDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 : PurchaseDao
 */
@Component
public interface PurchaseDao {

	// 회원정보 불러오기
	public MemberDto purchaseMember(String mail);

	// 구매완료
	public String purchaseInsertOk(PurchaseDto purchaseDto);

	// 구매완료 - 구매한 상품 정보 불러오기
	public CouponDto purchaseCouponSelect(String purchaseCode);

	// 해당 회원의 구매내역 카운트
	public int getCount(String memberCode);
	
	// 구매내역
	public List<PurchaseListDto> purchaseSelectAll(String memberCode);
	
	// 구매내역 카운트(관리자)
	public int getCountAll();
	
	// 구매내역(관리자)
	public List<PurchaseListDto> purchaseListAll();
	
	// 구매취소 불러오기
	public PurchaseListDto purchaseSelect(String purchaseCode);
	
	// 구매취소
	public int purchaseDelete(String purchaseCode);
}
