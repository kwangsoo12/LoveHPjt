package com.loveandheart.LH.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.loveandheart.LH.service.MenuService;
import com.loveandheart.LH.service.NoticeService;
import com.loveandheart.LH.service.VideoService;
import com.loveandheart.LH.util.ConfigUtil;
import com.loveandheart.LH.vo.GalleryVO;
import com.loveandheart.LH.vo.MenuListVO;
import com.loveandheart.LH.vo.NoticeVO;
import com.loveandheart.LH.vo.VideoVO;



/**
 * Handles requests for the application home page.
 */
@RestController
public class HomeController {
	@Inject
	VideoService videoService;
	
	@Inject
	NoticeService noticeService;
	
	@Inject
	MenuService menuService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav =  new ModelAndView();
		List<VideoVO> result = videoService.mainVideo();
		MenuListVO inVo = new MenuListVO();
		inVo.setHome_id(ConfigUtil.getHomeId());		
		inVo.setMenu_id(ConfigUtil.getMenuId());	
		
		GalleryVO galleryInVO = new GalleryVO();
		galleryInVO.setHome_id(inVo.getHome_id());
		galleryInVO.setMenu_id(inVo.getMenu_id());
		List<GalleryVO> galleryOutVO = menuService.getListGallery(galleryInVO);
		mav.addObject("gallery", galleryOutVO);
		mav.addObject("menu_id", inVo.getMenu_id());
		
		NoticeVO noticeInVO = new NoticeVO();
		noticeInVO.setHome_id(inVo.getHome_id());
		noticeInVO.setMenu_id(inVo.getMenu_id());
		List<NoticeVO> noticeOutVO = null;
		if (galleryOutVO.get(0).getGallery_type().equals("L")) {
			noticeOutVO = noticeService.getListNoticeOrderSeq(noticeInVO);
		} else {
			noticeOutVO = noticeService.getListNotice(noticeInVO);
		}
		mav.addObject("notice", noticeOutVO);
		mav.addObject("menu_name", inVo.getMenu_name());
		mav.addObject("video", result);
		mav.setViewName("index");
		return mav;
	}
}