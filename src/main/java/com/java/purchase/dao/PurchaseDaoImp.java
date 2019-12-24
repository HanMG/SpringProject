package com.java.purchase.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.member.dto.MemberDto;
import com.java.purchase.dto.PurchaseDto;
import com.java.purchase.dto.PurchaseListDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 17.
 * @작업 내용 :  PurchaseDaoImp
*/
@Component
public class PurchaseDaoImp implements PurchaseDao {
	@Autowired
	private SqlSessionTemplate sqlsessionTemplate;
	
	//구매 회원정보 불러오기
	@Override
	public MemberDto purchaseMember(String memberMail) {
		return sqlsessionTemplate.selectOne("dao.PurchaseMapper.memberSelect", memberMail);
	}
	
	//구매 완료
	@Override
	public String purchaseInsertOk(PurchaseDto purchaseDto) {
		 sqlsessionTemplate.insert("dao.PurchaseMapper.purchaseInsertOk", purchaseDto);
		 String purchaseCode = purchaseDto.getPurchaseCode();
		 
		 return purchaseCode;
	}
	
	//구매완료 - 구매한 상품 정보 불러오기
	@Override
	public CouponDto purchaseCouponSelect(String purchaseCode) {
		return sqlsessionTemplate.selectOne("dao.PurchaseMapper.purchaseCouponSelect", purchaseCode);
	}
	
	//구매내역 카운트
	@Override
	public int getCount(String memberCode) {
		return sqlsessionTemplate.selectOne("dao.PurchaseMapper.getCount", memberCode);
	}
	
	//구매내역
	@Override
	public List<PurchaseListDto> purchaseSelectAll(String memberCode, int startRow, int endRow) {
		Map<String, Object> allMap = new HashMap<String, Object>();
		allMap.put("memberCode", memberCode);
		allMap.put("startRow", startRow);
		allMap.put("endRow", endRow);
		
		return sqlsessionTemplate.selectList("dao.PurchaseMapper.purchaseList", allMap);
	}
	
	//구매내역전체(관리자) 카운트
	@Override
	public int getCountAll() {
		return sqlsessionTemplate.selectOne("dao.PurchaseMapper.getCountAll");
	}
	
	// 구매내역(관리자)
	@Override
	public List<PurchaseListDto> purchaseListAll(int startRow, int endRow) {
		Map<String, Object> allMap = new HashMap<String, Object>();
		allMap.put("startRow", startRow);
		allMap.put("endRow", endRow);
		
		return sqlsessionTemplate.selectList("dao.PurchaseMapper.purchaseListAll", allMap);
	}
	
	// 구매취소
	@Override
	public int purchaseDelete(String couponCode, String memberCode) {
		Map<String, String> pdMap = new HashMap<String, String>();
		pdMap.put("couponCode", couponCode);
		pdMap.put("memberCode", memberCode);
		
		return sqlsessionTemplate.update("dao.PurchaseMapper.purchaseDelete", pdMap);
	}
	
	
}
