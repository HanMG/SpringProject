package com.java.coupon.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.aop.JejuAspect;
import com.java.coupon.dto.CouponDto;
import com.java.coupon.dto.SearchFoodCodeDto;
import com.java.image.dto.ImageDto;

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
	public List<CouponDto> couponList(int startRow, int endRow, Date today) {
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("startRow", startRow);		
		listMap.put("endRow", endRow);		
		listMap.put("today", today);		
		
		return sqlSessionTemplate.selectList("dao.CouponMapper.couponList", listMap);
	}
	
	//쿠폰리스트(관리자)
	@Override
	public List<CouponDto> couponListAdmin() {
		return sqlSessionTemplate.selectList("dao.CouponMapper.couponListAdmin");
	}
	
	
	@Override
	@ResponseBody
	public List<CouponDto> couponListAjax(int startRow, int endRow, Date today) {
		Map<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("startRow", startRow);		
		listMap.put("endRow", endRow);		
		listMap.put("today", today);	
		
		return sqlSessionTemplate.selectList("dao.CouponMapper.couponList", listMap);
	}
	
	//쿠폰상세리스트
	@Override
	public CouponDto couponRead(String couponCode) {
		return sqlSessionTemplate.selectOne("dao.CouponMapper.couponSelect", couponCode);
	}
	
	//쿠폰 이미지 수정
	@Override
	public int couponImageUpdateOk(ImageDto imageDto) {
		return sqlSessionTemplate.update("dao.ImageMapper.couponUpdate", imageDto);
	}
	
	//쿠폰 수정
	@Override
	public int couponUpdateOk(CouponDto couponDto) {
		return sqlSessionTemplate.update("dao.CouponMapper.couponUpdate", couponDto);
	}
	
	//쿠폰 삭제
	@Override
	public int couponDeleteOk(String couponCode) {
		int check = 0;
		
		check = sqlSessionTemplate.update("dao.CouponMapper.couponDelete", couponCode);
		JejuAspect.logger.info(JejuAspect.logMsg + "check: " +check);
		
		return check;
	}
	
	
	@Override
	public CouponDto purchaseSelect(String couponCode) {
		return sqlSessionTemplate.selectOne("dao.CouponMapper.couponSelect",couponCode);
	}
}
