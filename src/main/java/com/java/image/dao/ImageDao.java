package com.java.image.dao;

import org.springframework.stereotype.Component;

import com.java.image.dto.ImageDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  ImageDao 생성
*/
@Component
public interface ImageDao {
	public int couponImageInsert(ImageDto imageDto);
}
