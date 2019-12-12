package com.java.coupon.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.coupon.dao.CouponDao;
import com.java.coupon.dto.CouponDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  CouponServiceImp 생성
 */

@Component
public class CouponServiceImp implements CouponService {
	
	@Autowired
	private CouponDao couponDao;
	
	//쿠폰상품 등록 페이지
	@Override
	public void couponInsert(ModelAndView mav) {
		mav.setViewName("coupon/couponInsert.tiles");
	}
	
	//쿠폰상품 등록
	@Override
	public void couponInsertOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		CouponDto couponDto =(CouponDto) map.get("couponDto");
		
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		MultipartFile upImage = request.getFile("file");
		long imageSize = upImage.getSize();
		
		
		
			String imageName = Long.toString(System.currentTimeMillis())+"_"+ upImage.getOriginalFilename();
			File path = new File("C:\\images\\");
			
			if(path.exists() && path.isDirectory()) {
				File file = new File(path, imageName);
				
				try {
					upImage.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				String imagePath = file.getAbsolutePath();
				
				mav.addObject("image_name", imageName);
				mav.addObject("image_size", imageSize);
				mav.addObject("image_path", imagePath);
				
				
				//int check = couponDao.couponInsert(couponInsert);
				
			}
	
		
		
		mav.addObject("couponDao",couponDao);
		JejuAspect.logger.info(JejuAspect.logMsg + couponDao);
		
		mav.setViewName("coupon/couponInsertOk.tiles");
	}
}
