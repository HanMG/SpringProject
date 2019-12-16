package com.java.coupon.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.coupon.dto.CouponDto;
import com.java.coupon.dto.SearchFoodCodeDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  CouponDaoImp 생성
 */
@Component
public class CouponDaoImp implements CouponDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//쿠폰상품 등록
	@Override
	public String couponInsert(CouponDto couponDto) {
		sqlSessionTemplate.insert("dao.CouponMapper.insert", couponDto);
		String couponCode = couponDto.getCouponCode();

		return couponCode;
	}
	
	//식당코드 검색
	@Override
	public List<SearchFoodCodeDto> searchFoodCode(String foodName) {
		return sqlSessionTemplate.selectList("dao.CouponMapper.selFoodCode", foodName);
	}
	
	//쿠폰 리스트 카운트
	@Override
	public int couponListCount() {
		return sqlSessionTemplate.selectOne("dao.CouponMapper.listCount");
	}
	
	//쿠폰리스트
	@Override
	public List<CouponDto> couponList(int startRow, int endRow) {
		Map<String, Integer> listMap = new HashMap<String, Integer>();
		listMap.put("startRow", startRow);		
		listMap.put("endRow", endRow);		
		
		return sqlSessionTemplate.selectList("dao.CouponMapper.couponList", listMap);
	}
	
	//쿠폰상세리스트
	@Override
	public CouponDto couponRead(String couponCode) {
		return sqlSessionTemplate.selectOne("dao.CouponMapper.couponRead", couponCode);
	}
	
}
