package com.java.coupon.service;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	//쿠폰상품 등록
	@Override
	public void couponInsertOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		CouponDto couponDto =(CouponDto) map.get("couponDto");
		JejuAspect.logger.info(JejuAspect.logMsg + "couponDto: "+ couponDto.toString());
		
		String couponStartdate = couponDto.getCouponStartdate();
		String couponEnddate = couponDto.getCouponEnddate();
		
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date sDate = date.parse(couponStartdate);
			Date eDate = date.parse(couponEnddate);
			
			JejuAspect.logger.info(JejuAspect.logMsg + "couponStartDate: " + sDate);
			JejuAspect.logger.info(JejuAspect.logMsg + "couponEnddate: " + eDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String couponCode = couponDao.couponInsert(couponDto);
		JejuAspect.logger.info(JejuAspect.logMsg + "couponCode: "+ couponCode);
		int check = 0;
		if(couponCode != null) {
			//TODO : 이미지 insert
			MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
			MultipartFile upImage = request.getFile("imageFile");
			
			long imageSize = upImage.getSize();
			String imageName = Long.toString(System.currentTimeMillis())+"_"+ upImage.getOriginalFilename();
			File imagePath = new File("D:\\jeonjiwon\\project\\image");
			imagePath.mkdir();
			
			JejuAspect.logger.info(JejuAspect.logMsg + "imageSize: "+ imageSize);
			JejuAspect.logger.info(JejuAspect.logMsg + "imageName: "+ imageName);
			JejuAspect.logger.info(JejuAspect.logMsg + "imagePath: "+ imagePath);
			
			if(imagePath.exists() && imagePath.isDirectory()) {
				File file = new File(imagePath, imageName);
				System.out.println("CHECK");
				try {
					upImage.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				ImageDto imageDto = new ImageDto();
				imageDto.setImageName(imageName);
				imageDto.setReferCode(couponCode);
				imageDto.setImageSize(imageSize);
				imageDto.setImagePath(file.getAbsolutePath());
				JejuAspect.logger.info(JejuAspect.logMsg + "imageDto: "+ imageDto.toString());
				
				check = imageDao.couponImageInsert(imageDto);
				JejuAspect.logger.info(JejuAspect.logMsg + "check: "+ check);
			}
		}
		mav.addObject("check", check);
		mav.setViewName("coupon/couponInsertOk.tiles");
	}
}
