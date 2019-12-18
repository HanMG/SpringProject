package com.java.coupon.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.coupon.dao.CouponDao;
import com.java.coupon.dto.CouponDto;
import com.java.image.dao.ImageDao;
import com.java.image.dto.ImageDto;

/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 12.
 * @작업 내용 :  CouponServiceImp 생성
 */

@Component
public class CouponServiceImp implements CouponService {
	
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private ImageDao imageDao;
	
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
		ImageDto imageDto = new ImageDto();
		
		
		String imageName = Long.toString(System.currentTimeMillis())+"_"+ upImage.getOriginalFilename();
		File path = new File("C:\\images\\");
		
		if(path.exists() && path.isDirectory()) {
			File file = new File(path, imageName);
			
			try {
				upImage.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			imageDto.setImageName(imageName);
			imageDto.setImagePath(file.getAbsolutePath());
			
			String couponCode = null;			
			couponCode = couponDao.couponInsert(couponDto);	//TODO
			JejuAspect.logger.info(JejuAspect.logMsg + "couponCode: "+ couponCode);
			
			if(couponCode != null) {
				JejuAspect.logger.info(JejuAspect.logMsg + "couponCode2: "+ couponCode);
				
//				Map<String, Object> cMap = new HashMap<String, Object>();
//				cMap.put("imageDto", imageDto);
//				cMap.put("couponCode",couponCode);
//				
//				int check = imageDao.imageInsert(cMap);	//TODO
			}
		}

		
		
		mav.addObject("couponDao",couponDao);
		JejuAspect.logger.info(JejuAspect.logMsg + couponDao);
		
		mav.setViewName("coupon/couponInsertOk.tiles");
	}
}
