package com.java.image.dao;
/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  ImageDaoImp 생성
*/

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ImageDaoImp {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
}
