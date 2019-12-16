package com.java.coupon.service;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.coupon.dao.CouponDao;
import com.java.coupon.dto.CouponDto;
import com.java.coupon.dto.SearchFoodCodeDto;
import com.java.image.dao.ImageDao;
import com.java.image.dto.ImageDto;


/**
 * @작성자 : 전지원
 * @작업일 : 2019. 12. 14.
 * @작업 내용 : insert & 식당코드 검색 작성
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
			//File imagePath = new File("D:\\jeonjiwon\\project\\image");
			File imagePath = new File("X:\\imageDB");
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
	
	//식당 코드 검색
	// TODO 
	@Override
	public void searchFoodCode(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String foodName = request.getParameter("foodName");
		JejuAspect.logger.info(JejuAspect.logMsg + "검색 내용: "+ foodName);
		
		if(foodName != null) {
			//검색어로 식당코드 찾기
			List<SearchFoodCodeDto> searchFoodCodeList = couponDao.searchFoodCode(foodName);
			
			JejuAspect.logger.info(JejuAspect.logMsg + "searchFoodCodeList 사이즈: "+ searchFoodCodeList.size());
			mav.addObject("foodCodeList", searchFoodCodeList);
		}
		mav.setViewName("coupon/searchFoodCode.empty");
	}
	
	
	//쿠폰리스트 TODO
	@Override
	public void couponList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String pageNumber = request.getParameter("pageNumber");
		
		if(pageNumber == null) pageNumber = "1";
		JejuAspect.logger.info(JejuAspect.logMsg + "pageNumber: "+ pageNumber);
		int currentPage = Integer.parseInt(pageNumber);
		
		//쿠폰 리스트 카운트
		int count = couponDao.couponListCount();
		JejuAspect.logger.info(JejuAspect.logMsg + "count: "+ count);
		
		
		int scrollSize = 10;
		int startRow = (currentPage - 1) * scrollSize + 1;
		int endRow = currentPage*scrollSize;
		
		List<CouponDto> couponList = null;
		
		if(count > 0) {
			//쿠폰 리스트 가져오기
			couponList = couponDao.couponList(startRow, endRow);
			JejuAspect.logger.info(JejuAspect.logMsg + "couponList 사이즈: "+ couponList.size());
			mav.addObject("couponList", couponList);
		}
		mav.addObject("count", count);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("coupon/couponList.tiles");
	}
	
	// TODO Auto-generated method stub
	//쿠폰상세페이지
	@Override
	public void couponRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		String couponCode = request.getParameter("couponCode");
		JejuAspect.logger.info(JejuAspect.logMsg + "couponCode : "+ couponCode + " pageNumber: " + pageNumber);
		
		CouponDto couponDto =couponDao.couponRead(couponCode);
		JejuAspect.logger.info(JejuAspect.logMsg + "couponDto : "+ couponDto.toString());
		
		if(couponDto.getImageName() != null) {
			int index = couponDto.getImageName().indexOf("_")+1;
			couponDto.setImageName(couponDto.getImageName().substring(index));
		}
		JejuAspect.logger.info(JejuAspect.logMsg + "couponDto : "+ couponDto.toString());
		
		mav.addObject("couponDto", couponDto);
		mav.setViewName("coupon/couponDetail.tiles");
	}
	
	//쿠폰상품수정페이지
	@Override
	public void couponUpdate(ModelAndView mav) {
		// TODO Auto-generated method stub
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String couponCode = request.getParameter("couponCode");
		
		CouponDto couponDto = couponDao.couponRead(couponCode);
		JejuAspect.logger.info(JejuAspect.logMsg + "couponDto : "+ couponDto.toString());
		mav.addObject("couponDto",couponDto);
		mav.setViewName("coupon/couponUpdate.tiles");
	}
	
	
	
}
