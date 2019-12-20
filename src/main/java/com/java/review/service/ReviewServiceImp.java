package com.java.review.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.java.aop.JejuAspect;
import com.java.image.dao.ImageDao;
import com.java.image.dto.ImageDto;
import com.java.review.dao.ReviewDao;
import com.java.review.dto.ReviewDto;

@Component
public class ReviewServiceImp implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ImageDao imageDao;

	@Override
	public void reviewInsert(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String foodCode = request.getParameter("foodCode");
		String foodName = reviewDao.getFoodName(foodCode);		
		mav.addObject("foodName", foodName);
		mav.addObject("foodCode",foodCode);
		mav.setViewName("review/insert.tiles");
	}

	@Override
	public void reviewInsertOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");		
		List<MultipartFile> files = request.getFiles("imgFile");
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		reviewDto.setReviewDate(new Date());
		JejuAspect.logger.info(JejuAspect.logMsg + reviewDto);
		int check = reviewDao.reviewInsertOk(reviewDto);
		String reviewCode = reviewDao.getReviewCode();
		for (MultipartFile f : files) {			
			if (!f.isEmpty()) {
				ImageDto imageDto = new ImageDto();
				imageDto.setReferCode(reviewCode);
				long fileSize = f.getSize();
				if (fileSize != 0) {
					String fileName = Long.toString(System.currentTimeMillis()) + "_" + f.getOriginalFilename();

					File path = new File("C:\\Spring\\workspace\\eathejeju\\src\\main\\webapp\\resources\\ftp");
					// C://Spring//workspace//springProject//resources//ftp
					// C:\\ftp\\
					path.mkdir();					

					if (path.exists() && path.isDirectory()) {
						File file = new File(path, fileName);
						try {
							f.transferTo(file);
						} catch (IOException e) {
							e.printStackTrace();
						}
						imageDto.setImagePath(file.getAbsolutePath());
						imageDto.setImageSize(fileSize);
						imageDto.setImageName(fileName);
						JejuAspect.logger.info(JejuAspect.logMsg + imageDto.toString());
						JejuAspect.logger.info(JejuAspect.logMsg+check);
						check += imageDao.imgInsertReview(imageDto);
					}
				}
			}
		}
		mav.addObject("foodCode",reviewDto.getFoodCode());
		mav.addObject("check", check);
		mav.setViewName("review/insertOk.tiles");
	}

	@Override
	public void reviewUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String reviewCode = request.getParameter("reviewCode");
		ReviewDto reviewDto = new ReviewDto();
		reviewDto = reviewDao.reviewUpdate(reviewCode);
		String foodName = reviewDao.getFoodName(reviewDto.getFoodCode());
		List<ImageDto> listImage = imageDao.imgList(reviewCode);		
		JejuAspect.logger.info(JejuAspect.logMsg+listImage.toString());
		mav.addObject("foodName",foodName);
		mav.addObject("reviewDto",reviewDto);
		mav.addObject("listImage",listImage);
		mav.setViewName("review/update.tiles");		
	}

	@Override
	public void reviewUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");		
		List<MultipartFile> files = request.getFiles("imgFile");
		ReviewDto reviewDto = (ReviewDto) map.get("reviewDto");
		reviewDto.setReviewDate(new Date());
		JejuAspect.logger.info(JejuAspect.logMsg + reviewDto);
		int check = reviewDao.reviewUpdateOk(reviewDto);
		String reviewCode = reviewDto.getReviewCode();
		String delStr = request.getParameter("deleteImg");
		JejuAspect.logger.info(JejuAspect.logMsg + delStr.toString());
		if(delStr != null && !delStr.equals("")) {
			String[] delList = delStr.split(","); 
			for(int i = 0; i < delList.length; i++) {
				ImageDto imageDelDto = new ImageDto();
				imageDelDto.setReferCode(reviewCode);
				imageDelDto.setImageName(delList[i]);
				ImageDto imageDto = imageDao.imgSelect(imageDelDto);				
				if (imageDto.getImageName() != null) {
					File checkFile = new File(imageDto.getImagePath());
					if (checkFile.exists() && checkFile.isFile()) {
						checkFile.delete();
					}
				}
				imageDao.imgSelectDelete(imageDelDto);
			}		
		}		
		for (MultipartFile f : files) {			
			if (!f.isEmpty()) {
				ImageDto imageDto = new ImageDto();
				imageDto.setReferCode(reviewCode);
				long fileSize = f.getSize();
				if (fileSize != 0) {
					String fileName = Long.toString(System.currentTimeMillis()) + "_" + f.getOriginalFilename();

					File path = new File("C:\\Spring\\workspace\\eathejeju\\src\\main\\webapp\\resources\\ftp");
					// C://Spring//workspace//springProject//resources//ftp
					// C:\\ftp\\
					path.mkdir();					

					if (path.exists() && path.isDirectory()) {
						File file = new File(path, fileName);
						try {
							f.transferTo(file);
						} catch (IOException e) {
							e.printStackTrace();
						}
						imageDto.setImagePath(file.getAbsolutePath());
						imageDto.setImageSize(fileSize);
						imageDto.setImageName(fileName);
						JejuAspect.logger.info(JejuAspect.logMsg + imageDto.toString());
						JejuAspect.logger.info(JejuAspect.logMsg+check);
						check += imageDao.imgInsertReview(imageDto);
					}
				}
			}
		}
		mav.addObject("check", check);
		mav.setViewName("review/updateOk.tiles");		
	}
	
	@Override
	public void reviewRead(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String reviewCode = request.getParameter("reviewCode");
		ReviewDto reviewDto = new ReviewDto();
		reviewDto = reviewDao.reviewUpdate(reviewCode);
		String foodName = reviewDao.getFoodName(reviewDto.getFoodCode());
		List<ImageDto> listImage = imageDao.imgList(reviewCode);		
		JejuAspect.logger.info(JejuAspect.logMsg+listImage.toString());
		mav.addObject("foodName",foodName);
		mav.addObject("reviewDto",reviewDto);
		mav.addObject("listImage",listImage);
		mav.setViewName("review/read.tiles");			
	}
	
	@Override
	public void reviewDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String reviewCode = request.getParameter("reviewCode");
		int check = 0;
		List<ImageDto> imageList = imageDao.imgList(reviewCode);
		for(int i = 0; i< imageList.size(); i++) {
			if (imageList.get(i).getImageName() != null) {
				File checkFile = new File(imageList.get(i).getImagePath());
				if (checkFile.exists() && checkFile.isFile()) {
					checkFile.delete();
				}
			}
		}		
		check = reviewDao.reviewDelete(reviewCode);
		check += imageDao.imgDelete(reviewCode);
		mav.setViewName("review/delete.tiles");
	}

	@Override
	public void imageDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		String reviewCode = request.getParameter("reviewCode");
		String imageName = request.getParameter("imageName");		
		ImageDto imageDto = new ImageDto();
		imageDto.setReferCode(reviewCode);
		imageDto.setImageName(imageName);
		int check = 0;
		check = imageDao.imgSelectDelete(imageDto);
		mav.setViewName("review/update.tiles?reviewCode="+reviewCode);		
	}





}
