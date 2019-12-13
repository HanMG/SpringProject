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
	
//	@Autowired
//	private ImageDao imageDao;
	
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
		//String couponCode = couponDao.couponInsert(couponDto);
		JejuAspect.logger.info(JejuAspect.logMsg + "couponCode: "+ couponCode);

		//TODO : 이미지 insert
//		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
//		MultipartFile upImage = request.getFile("file");
//		long imageSize = upImage.getSize();
//		ImageDto imageDto = (ImageDto) map.get("imageDto");
//		JejuAspect.logger.info(JejuAspect.logMsg + "imageDto: "+ imageDto.toString());
//
//		String imageName = Long.toString(System.currentTimeMillis())+"_"+ upImage.getOriginalFilename();
//		File path = new File("C:\\images\\");
//		
//		if(path.exists() && path.isDirectory()) {
//			File file = new File(path, imageName);
//			
//			try {
//				upImage.transferTo(file);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			imageDto.setImageName(imageName);
//			imageDto.setImagePath(file.getAbsolutePath());
//			imageDto.setImageSize(Integer.parseInt(imageName));
//			
//			if(couponCode != null) {
//				JejuAspect.logger.info(JejuAspect.logMsg + "couponCode2: "+ couponCode);
//				
//				Map<String, Object> cMap = new HashMap<String, Object>();
//				cMap.put("imageDto", imageDto);
//				cMap.put("couponCode",couponCode);
//				
//				int check = imageDao.imageInsert(cMap);	//TODO
//			}
//		}
//		int check = couponDao.couponInsert(couponDto);	//TODO
//		JejuAspect.logger.info(JejuAspect.logMsg + "check: "+ check);
		mav.addObject("couponDao",couponDao);
		JejuAspect.logger.info(JejuAspect.logMsg + couponDao);
		
		//mav.setViewName("coupon/couponInsertOk.tiles");
	}
}
