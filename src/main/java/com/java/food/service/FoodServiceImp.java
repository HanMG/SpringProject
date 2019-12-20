package com.java.food.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.coupon.dto.CouponDto;
import com.java.food.dao.FoodDao;
import com.java.food.dto.FoodDto;
import com.java.food.dto.FoodReviewDto;
import com.java.image.dao.ImageDao;
import com.java.image.dto.ImageDto;
import com.java.review.dto.ReviewCountDto;

/**
 * @작성자 : 한문구
 * @작성일 : 2019. 12. 13.
 * @설명 : 음식점 서비스  
 */

@Component
public class FoodServiceImp implements FoodService {	
	@Autowired
	private FoodDao foodDao;	
	
	@Autowired
	private ImageDao imageDao;
	
	// 음식점 등록, 대표이미지등록
	@Override
	public void foodInsertOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		FoodDto foodDto = (FoodDto) map.get("foodDto");
		int check = 0;
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		// 등록날짜 설정
		foodDto.setFoodDate(new Date());
		// 조회수 0 으로 설정
		foodDto.setFoodRead(0);
		// 음식점 공개상태는 처음시 검토중으로
		foodDto.setFoodStatus("검토중");		
		// 음식점 등록
		check = foodDao.foodInsert(foodDto);
		// food_code의 마지막 값 가져옴
		String str = foodDao.foodMax();	
		
		// 이미지 데이터를 넣을 DTO 
		ImageDto imageDto = new ImageDto();
		// 음식점 등록이 되면 이미지DTO.참조코드에 foodCode의 마지막 값을 넣음
		if(check > 0) {			
			imageDto.setReferCode(str);  
		}
		// input type file의 name(imgFile)으로 확인
		MultipartFile upFile = request.getFile("imgFile"); 
		long fileSize = upFile.getSize();		
		if (fileSize != 0) {
			// 파일명 = 현재시간을 초단위로 변환한 값 + 올려질때 파일명
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			// 파일 생성위치 
			File path = new File("C:\\Spring\\workspace\\eathejeju\\src\\main\\webapp\\resources\\ftp");
			// 만들고자하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 생성 불가...
			path.mkdir();
			// 만들고자하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성
			//path.mkdirs();

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				try {
					upFile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}				
				imageDto.setImagePath(file.getAbsolutePath());
				imageDto.setImageSize(fileSize);
				imageDto.setImageName(fileName);
				check += imageDao.imgInsert(imageDto);				
			}					
		}		
		
		mav.addObject("check", check);
		mav.setViewName("food/insertOk.tiles");
		
	}

	@Override
	public void foodRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");
		String foodCode = request.getParameter("foodCode");
		FoodDto foodDto = new FoodDto();
		ImageDto imageDto = new ImageDto();
		ReviewCountDto reviewCountDto = new ReviewCountDto();
		
		// 음식점 정보 가져오기
		foodDto = foodDao.foodRead(foodCode);
		// 음식점 이미지 정보 가져오기
		imageDto = imageDao.imgRead(foodCode);
		// 쿠폰정보
		List<CouponDto> couponDtoList = foodDao.foodCouponList(foodCode); 
		Cookie[] cookies = request.getCookies();
		// 비교하기 위해 새로운 쿠키
        Cookie viewCookie = null; 
        // 쿠키가 있을 경우 
        if (cookies != null && cookies.length > 0) 
        {
            for (int i = 0; i < cookies.length; i++)
            {
                // Cookie의 name이 cookie + foodCode와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie"+foodCode))
                {                   
                    viewCookie = cookies[i];
                }
            }
        }
        // 쿠키가 없을 경우
        if (viewCookie == null) {                       
            // 쿠키 생성(이름, 값)
            Cookie newCookie = new Cookie("cookie"+foodCode, "|" + foodCode + "|");                            
            // 쿠키 추가
            response.addCookie(newCookie);
            // 조회수 증가
            foodDao.foodReadUpdate(foodCode);
        }		
		
		// 리뷰 카운트
        reviewCountDto = foodDao.foodReivewCount(foodCode);
        JejuAspect.logger.info(JejuAspect.logMsg+"reviewCount"+reviewCountDto.toString());
        // 리뷰 평균 점수
        float reviewAvg = foodDao.foodReviewAvg(foodCode);
        // 보낼 데이터
		mav.addObject("reviewAvg", reviewAvg);
		mav.addObject("reviewCountDto",reviewCountDto);	
		mav.addObject("couponDtoList", couponDtoList);
		mav.addObject("foodDto", foodDto);	
		mav.addObject("imageDto", imageDto);
		mav.setViewName("food/read.tiles");		
	}

	@Override
	public void foodUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String foodCode = request.getParameter("foodCode");		
		FoodDto foodDto = new FoodDto();		
		ImageDto imageDto = new ImageDto(); 
		// 음식점 정보 가져오기
		foodDto = foodDao.foodRead(foodCode);
		// 이미지 정보 가져오기
		imageDto = imageDao.imgRead(foodCode);
		JejuAspect.logger.info(JejuAspect.logMsg+foodDto);
		JejuAspect.logger.info(JejuAspect.logMsg+imageDto);
		mav.addObject("foodDto", foodDto);		;
		mav.addObject("imageDto", imageDto);
		mav.setViewName("food/update.tiles");
	}
	
	@Override
	public void foodUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		FoodDto foodDto = (FoodDto) map.get("foodDto");
		ImageDto imageDto = (ImageDto) map.get("imageDto");
		int check = 0;
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		
		// 업로드 등록일자 
		foodDto.setFoodDate(new Date());				
		
		// food 업데이트
		check = foodDao.foodUpdate(foodDto);
		
		MultipartFile upFile = request.getFile("imgFile"); // input type file의 name으로 확인
		long fileSize = upFile.getSize();		
		if (fileSize != 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();

			File path = new File("C:\\Spring\\workspace\\eathejeju\\src\\main\\webapp\\resources\\ftp");
			//C://Spring//workspace//springProject//resources//ftp
			//C:\\ftp\\
			path.mkdir();	
			
			JejuAspect.logger.info(JejuAspect.logMsg+imageDto.getImageName());
			if (imageDto.getImageName() != null) {
				JejuAspect.logger.info(JejuAspect.logMsg+imageDto.getImagePath());
				File checkFile = new File(imageDto.getImagePath());
				if (checkFile.exists() && checkFile.isFile()) {
					checkFile.delete();
				}
			}

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				try {
					upFile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}				
				imageDto.setImagePath(file.getAbsolutePath());
				imageDto.setImageSize(fileSize);
				imageDto.setImageName(fileName);
				JejuAspect.logger.info(JejuAspect.logMsg+imageDto.toString());
				check += imageDao.imgUpdate(imageDto);				
			}			
		}
		
		mav.addObject("check", check);
		mav.setViewName("food/updateOk.tiles");		
	}
	
	@Override
	public void foodDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String foodCode = request.getParameter("foodCode");
		int check = 0;		
		
		// 삭제할 이미지 정보를 가져옴
		ImageDto imageDto = imageDao.imgRead(foodCode);	
		
		// 가져온 이미지 정보가 있을 경우 해당 경로의 파일을 삭제
		if (imageDto.getImageName() != null) {
			File checkFile = new File(imageDto.getImagePath());
			if (checkFile.exists() && checkFile.isFile()) {
				checkFile.delete();
			}
		}
		// 음식점 코드를 통해 DB에서 음식점 정보 삭제
		check += foodDao.foodDelete(foodCode);
		
		// 음식점 코드를 통해 DB에서 이미지 정보 삭제
		check += imageDao.imgDelete(foodCode);
		
		mav.addObject("check",check);
		mav.setViewName("food/delete.tiles");		
	}

	@Override
	public void foodReviewList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String foodCode = request.getParameter("foodCode");
		String selScore = request.getParameter("selScore");
		ReviewCountDto reviewCountDto = foodDao.foodReivewCount(foodCode);
		JejuAspect.logger.info(JejuAspect.logMsg + reviewCountDto.toString());
		List<FoodReviewDto> foodReviewList = null;
		if (reviewCountDto != null) {			
			foodReviewList = foodDao.foodReviewList(foodCode, selScore);
			JejuAspect.logger.info(JejuAspect.logMsg+foodReviewList.size());
			mav.addObject("foodReviewList",foodReviewList);
			JejuAspect.logger.info(JejuAspect.logMsg+foodReviewList.toString());
		}		
		mav.addObject("reviewCountDto",reviewCountDto);		
		mav.setViewName("review/list.empty");
		
	}

}
