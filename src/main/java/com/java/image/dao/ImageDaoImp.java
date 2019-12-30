package com.java.image.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import com.java.image.dto.ImageDto;

import com.java.aop.JejuAspect;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 19.
 * @설명 : 이미지 DAO
 */

@Component
public class ImageDaoImp implements ImageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;	

	@Override
	public int imgInsert(ImageDto imageDto) {
		return sqlSession.insert("dao.ImageMapper.imgInsert",imageDto);
	}

	@Override
	public ImageDto imgRead(String referCode) {		
		return sqlSession.selectOne("dao.ImageMapper.imgRead", referCode);
	}

	@Override
	public int imgDelete(String referCode) {		
		return sqlSession.delete("dao.ImageMapper.imgDelete", referCode);
	}

	@Override
	public int imgUpdate(ImageDto imageDto) {	
		return sqlSession.update("dao.ImageMapper.imgUpdate", imageDto);
	}

	@Override
	public int imgInsertReview(ImageDto imageDto) {		
		return sqlSession.insert("dao.ImageMapper.imgInsertReview",imageDto);
	}

	@Override
	public List<ImageDto> imgList(String referCode) {		
		return sqlSession.selectList("dao.ImageMapper.imgListReview", referCode);
	}	
	
	@Override
	public ImageDto imgSelect(ImageDto imageDelDto) {		
		return sqlSession.selectOne("dao.ImageMapper.imgSelect", imageDelDto);
	}	

	@Override
	public int imgSelectDelete(ImageDto imageDto) {
		return sqlSession.delete("dao.ImageMapper.imgSelectDelete", imageDto);
	}	

	//쿠폰이미지 삽입
	@Override
	public int couponImageInsert(ImageDto imageDto) {
		int check = sqlSession.insert("dao.ImageMapper.couponImageInsert", imageDto);
		JejuAspect.logger.info(JejuAspect.logMsg + "check: "+ check);
		return check;
	}

}
