package com.java.coupon.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.JejuAspect;
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
		List<SearchFoodCodeDto> searchFoodCodeDto = sqlSessionTemplate.selectList("dao.CouponMapper.selFoodCode", foodName);
		JejuAspect.logger.info(JejuAspect.logMsg + "List: "+ searchFoodCodeDto.size());
		
		return searchFoodCodeDto;
	}
	
}
