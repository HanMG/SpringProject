package com.java.image.dao;
/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  ImageDaoImp 생성
*/

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.aop.JejuAspect;
import com.java.image.dto.ImageDto;

@Component
public class ImageDaoImp implements ImageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//쿠폰이미지 삽입
	@Override
	public int couponImageInsert(ImageDto imageDto) {
		int check = sqlSessionTemplate.insert("dao.ImageMapper.couponImageInsert", imageDto);
		JejuAspect.logger.info(JejuAspect.logMsg + "check: "+ check);
		return check;
	}
	
}
