package com.java.food.service;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
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
import com.java.review.dao.ReviewDao;
import com.java.review.dto.ReviewCountDto;
import com.java.review.dto.ReviewDto;
import com.java.search.dao.SearchDao;
import com.java.search.dto.SearchFoodDto;

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
	
	@Autowired
	private SearchDao searchDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
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
		// 음식점 등록
		check = foodDao.foodInsert(foodDto);
		// food_code의 마지막 값 가져옴
		String str = foodDao.foodMax();	
		JejuAspect.logger.info(JejuAspect.logMsg+ "str : " +str);
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
			File path = new File("C:\\Spring\\workspace\\image"); 
			// 만들고자하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 생성 불가...
			path.mkdirs();
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
				JejuAspect.logger.info(JejuAspect.logMsg+ "imageDto : " +imageDto);
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

		// 리뷰 리스트 가져오기 위한 Dao
		List<FoodReviewDto> reviewList = null;
		reviewList = foodDao.reviewList(foodCode);
		//JejuAspect.logger.info(JejuAspect.logMsg+ "reviewList : " +reviewList.toString());
		mav.addObject("reviewList",reviewList);
		String reviewCode = null;
		// 리뷰코드를 통해 리뷰 상세페이지를 가져오기 위한 Dao
		for (int i = 0; i < reviewList.size(); i++) {
			reviewCode = reviewList.get(i).getReviewCode();
			JejuAspect.logger.info(JejuAspect.logMsg+ "reviewCode : " +reviewCode);
			mav.addObject("reviewCode",reviewCode);
		}
		
		ReviewDto reviewDto = new ReviewDto();
		if (reviewCode != null) {
			reviewDto = reviewDao.reviewUpdate(reviewCode);
			List<ImageDto> listImage = imageDao.imgList(reviewCode);		
			JejuAspect.logger.info(JejuAspect.logMsg+listImage.toString());
			mav.addObject("listImage",listImage);
		}
		mav.addObject("reviewDto",reviewDto);
		
		// 별점을 가져오기 위한 Dao
		SearchFoodDto searchFoodDto = new SearchFoodDto();
		searchFoodDto = searchDao.getReviewScore(foodCode);
		if (searchFoodDto != null) {
			mav.addObject("searchFoodDto",searchFoodDto);
		}
		// 음식점 정보 가져오기
		foodDto = foodDao.foodRead(foodCode);
		JejuAspect.logger.info(JejuAspect.logMsg+foodDto);
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
		// 즐겨찾기 카운트 
        String favoriteCnt = Integer.toString(foodDao.foodFavorite(foodCode));
		// 리뷰 카운트
        reviewCountDto = foodDao.foodReivewCount(foodCode);
        JejuAspect.logger.info(JejuAspect.logMsg+"reviewCount"+reviewCountDto.toString());
        // 리뷰 평균 점수
        float reviewAvg = foodDao.foodReviewAvg(foodCode);
        // 보낼 데이터
        mav.addObject("favoriteCnt", favoriteCnt);
		mav.addObject("reviewAvg", reviewAvg);
		mav.addObject("reviewCountDto",reviewCountDto);			
		mav.addObject("couponDtoList", couponDtoList);
		//JejuAspect.logger.info(JejuAspect.logMsg+"couponDtoList"+couponDtoList.toString());
		mav.addObject("foodDto", foodDto);	
		mav.addObject("imageDto", imageDto);
		//JejuAspect.logger.info(JejuAspect.logMsg+"couponDtoList"+couponDtoList.toString());
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
		mav.addObject("foodDto", foodDto);		
		if(imageDto != null) {
			mav.addObject("imageDto", imageDto);
		}
		mav.setViewName("food/update.tiles");
	}
	
	@Override
	public void foodUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		FoodDto foodDto = (FoodDto) map.get("foodDto");
		ImageDto originImageDto = imageDao.imgRead(foodDto.getFoodCode());
		
		int check = 0;
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");
		
		// 업로드 등록일자 
		foodDto.setFoodDate(new Date());				
		
		// food 업데이트
		check = foodDao.foodUpdate(foodDto);
		
		ImageDto updateImageDto = new ImageDto();
		MultipartFile upFile = request.getFile("imgFile"); // input type file의 name으로 확인
		long fileSize = upFile.getSize();		
		if (fileSize != 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();

			File path = new File("C:\\Spring\\workspace\\image"); 
			//C://Spring//workspace//springProject//resources//ftp
			//C:\\ftp\\
			path.mkdirs();	
			
			
			if (originImageDto != null) {
				JejuAspect.logger.info(JejuAspect.logMsg+originImageDto.getImagePath());
				File checkFile = new File(originImageDto.getImagePath());
				if (checkFile.exists() && checkFile.isFile()) {
					checkFile.delete();
				}
				imageDao.imgDelete(originImageDto.getReferCode());
			}

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				try {
					upFile.transferTo(file);
				} catch (IOException e) {
					e.printStackTrace();
				}				
				updateImageDto.setReferCode(foodDto.getFoodCode());  
				updateImageDto.setImagePath(file.getAbsolutePath());
				updateImageDto.setImageSize(fileSize);
				updateImageDto.setImageName(fileName);
				JejuAspect.logger.info(JejuAspect.logMsg+updateImageDto.toString());				
				check += imageDao.imgInsert(updateImageDto);			
			}			
		}
		
		mav.addObject("check", check);
		mav.setViewName("food/updateOk.tiles");		
	}
	
	// 음식점 정보 삭제
	@Override
	public void foodDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String foodCode = request.getParameter("foodCode");
		int check = 0;		
		
		// 삭제할 이미지 정보를 가져옴
		ImageDto imageDto = imageDao.imgRead(foodCode);	
		
		// 가져온 이미지 정보가 있을 경우 해당 경로의 파일을 삭제
		if(imageDto != null) {
			if (imageDto.getImageName() != null) {
				File checkFile = new File(imageDto.getImagePath());
				if (checkFile.exists() && checkFile.isFile()) {
					checkFile.delete();
				}
			}
			// 음식점 코드를 통해 DB에서 이미지 정보 삭제
			check += imageDao.imgDelete(foodCode);
		}
		// 음식점 코드를 통해 DB에서 음식점 정보 삭제
		check += foodDao.foodDelete(foodCode);		
		
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
	
	
	// 관리자 음식점페이지로 이동 및 전체 정보를 가져오기


	@Override
	public void adminFoodList(ModelAndView mav) {		
		List<FoodDto> foodDtoList = foodDao.foodDtoList();	
		//JejuAspect.logger.info(JejuAspect.logMsg+foodDtoList.toString());
		mav.addObject("foodDtoList",foodDtoList);
		mav.setViewName("admin/food.admin");		
	}

	
	// 관리자 음식점페이지에서 게시글 클릭시 해당 게시글의 정보를 ajax로 가져오기
	@Override
	public void getFood(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");		
		String foodCode = request.getParameter("foodCode");
		FoodDto foodDto = foodDao.foodRead(foodCode);
		ImageDto imageDto = imageDao.imgRead(foodCode);		
		
		HashMap<String, Object> jsonHashMap = new HashMap<String, Object>();		
		
		if(imageDto != null) {			
			jsonHashMap.put("imageName", imageDto.getImageName());
		}	

		jsonHashMap.put("foodCode", foodDto.getFoodCode());
		jsonHashMap.put("foodName", foodDto.getFoodName());
		jsonHashMap.put("foodAddr", foodDto.getFoodAddr());
		jsonHashMap.put("foodArea", foodDto.getFoodArea());
		jsonHashMap.put("foodPhone", foodDto.getFoodPhone());
		jsonHashMap.put("foodKind", foodDto.getFoodKind());
		jsonHashMap.put("foodMenu", foodDto.getFoodMenu());
		jsonHashMap.put("foodTime", foodDto.getFoodTime());
		jsonHashMap.put("foodBreak", foodDto.getFoodBreak());
		jsonHashMap.put("foodIntro", foodDto.getFoodIntro());
		jsonHashMap.put("foodStatus", foodDto.getFoodStatus());
		jsonHashMap.put("foodStatus", foodDto.getFoodStatus());
		jsonHashMap.put("memberCode", foodDto.getMemberCode());	
		JSONObject jsonFoodDto = new JSONObject(jsonHashMap);
		JejuAspect.logger.info(JejuAspect.logMsg+jsonFoodDto.toString());		
		
		String jsonText = jsonFoodDto.toJSONString();
		JejuAspect.logger.info(JejuAspect.logMsg+"jsonText: "+jsonText);
		
		response.setContentType("application/x-json;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.print(jsonText);
			out.close();
		}catch(IOException e){
			e.printStackTrace();
		}
	}

}
