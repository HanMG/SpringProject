package com.java.image.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.java.image.dto.ImageDto;

@Component
public class ImageDaoImp implements ImageDao {
	@Autowired
	private SqlSessionTemplate sqlSession;	

	@Override
	public int imgInsert(ImageDto imageDto) {
		return sqlSession.insert("dao.ImageMapper.imgInsert",imageDto);
	}

	@Override
	public ImageDto imgRead(String foodCode) {		
		return sqlSession.selectOne("dao.ImageMapper.imgRead", foodCode);
	}

	@Override
	public int imgDelete(String foodCode) {		
		return sqlSession.delete("dao.ImageMapper.imgDelete", foodCode);
	}

	@Override
	public int imgUpdate(ImageDto imageDto) {	
		return sqlSession.update("dao.ImageMapper.imgUpdate", imageDto);
	}
}
