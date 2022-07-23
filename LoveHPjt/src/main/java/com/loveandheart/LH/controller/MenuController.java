package com.loveandheart.LH.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.loveandheart.LH.service.MenuService;
import com.loveandheart.LH.service.NoticeService;
import com.loveandheart.LH.util.ConfigUtil;
import com.loveandheart.LH.vo.GalleryVO;
import com.loveandheart.LH.vo.LayoutVO;
import com.loveandheart.LH.vo.MenuListVO;
import com.loveandheart.LH.vo.NoticeVO;



/**
 * Handles requests for the application home page.
 */
@RestController
public class MenuController {
	@Inject
	MenuService menuService;
	
	@Inject
	NoticeService noticeService;
	
	@RequestMapping(value="/getListMenu") 
	@ResponseBody
	public List<MenuListVO> getMenuList(MenuListVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		List<MenuListVO> menuList = menuService.getListMenu(inVo);
		return menuList;
	}

	@RequestMapping(value="/getPage") 
	@ResponseBody
	public ModelAndView getPage(MenuListVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		ModelAndView mav =  new ModelAndView();
		LayoutVO layoutInVO = new LayoutVO();
		layoutInVO.setHome_id(inVo.getHome_id());
		layoutInVO.setMenu_id(inVo.getMenu_id());
		
		LayoutVO layoutOutVO = menuService.getLayout(layoutInVO);
		if (layoutOutVO == null) {
			NoticeVO noticeInVO = new NoticeVO();
			noticeInVO.setHome_id(inVo.getHome_id());
			noticeInVO.setMenu_id(inVo.getMenu_id());
			noticeInVO.setPageNo(inVo.getPageNo());
			noticeInVO.setSearch("1");
			noticeInVO.setKeyWord("2");
			List<NoticeVO> noticeOutVO = noticeService.getPageListNotice(noticeInVO);
			NoticeVO cntOutVO = noticeService.getPageCount(noticeInVO);
			
			mav.addObject("notice", noticeOutVO);
			mav.addObject("cnt", cntOutVO);			
			mav.addObject("page", inVo.getPageNo()+"");			
			mav.addObject("home_id", inVo.getHome_id());
			mav.addObject("menu_id", inVo.getMenu_id());
			mav.addObject("menu_name", inVo.getMenu_name());
			mav.setViewName("notice");
		} else {
			if (layoutOutVO.getGallary_yn().equals("Y")) {
				GalleryVO galleryInVO = new GalleryVO();
				galleryInVO.setHome_id(inVo.getHome_id());
				galleryInVO.setMenu_id(inVo.getMenu_id());
				List<GalleryVO> galleryOutVO = menuService.getListGallery(galleryInVO);
				mav.addObject("gallery", galleryOutVO);
				mav.addObject("menu_id", inVo.getMenu_id());
				if (layoutOutVO.getNotice_yn().equals("Y")) {
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
				}
				mav.addObject("menu_name", inVo.getMenu_name());
				if (galleryOutVO.get(0).getGallery_type().equals("L")) {
					mav.setViewName("galleryList");
				} else {
					mav.setViewName("gallery");
				}
			} else if (layoutOutVO.getNotice_yn().equals("Y")) {
				NoticeVO noticeInVO = new NoticeVO();
				noticeInVO.setHome_id(inVo.getHome_id());
				noticeInVO.setMenu_id(inVo.getMenu_id());
				noticeInVO.setPageNo(inVo.getPageNo());
				noticeInVO.setSearch("1");
				noticeInVO.setKeyWord("2");
				List<NoticeVO> noticeOutVO = noticeService.getPageListNotice(noticeInVO);
				NoticeVO cntOutVO = noticeService.getPageCount(noticeInVO);
				
				mav.addObject("notice", noticeOutVO);
				mav.addObject("cnt", cntOutVO);			
				mav.addObject("page", inVo.getPageNo()+"");			
				mav.addObject("home_id", inVo.getHome_id());
				mav.addObject("menu_id", inVo.getMenu_id());
				mav.addObject("menu_name", inVo.getMenu_name());
				mav.setViewName("notice");
			} else if (layoutOutVO.getYoutobe_yn().equals("Y")) {
				NoticeVO noticeInVO = new NoticeVO();
				noticeInVO.setHome_id(inVo.getHome_id());
				noticeInVO.setMenu_id(inVo.getMenu_id());
				noticeInVO.setPageNo(inVo.getPageNo());
				noticeInVO.setSearch("1");
				noticeInVO.setKeyWord("2");
				List<NoticeVO> noticeOutVO = noticeService.getListNoticeOrderSeq(noticeInVO);
				// NoticeVO cntOutVO = noticeService.getPageCount(noticeInVO);
				
				mav.addObject("notice", noticeOutVO);
				// mav.addObject("cnt", cntOutVO);			
				mav.addObject("page", inVo.getPageNo()+"");			
				mav.addObject("home_id", inVo.getHome_id());
				mav.addObject("menu_id", inVo.getMenu_id());
				mav.addObject("menu_name", inVo.getMenu_name());
				mav.setViewName("youtubeList");
			} else if (layoutOutVO.getPage_view_yn().equals("Y")) {
				NoticeVO noticeInVO = new NoticeVO();
				noticeInVO.setHome_id(inVo.getHome_id());
				noticeInVO.setMenu_id(inVo.getMenu_id());

				List<NoticeVO> noticeOutVO = noticeService.listNotice(noticeInVO);
				
				mav.addObject("notice", noticeOutVO);
				mav.addObject("page", inVo.getPageNo()+"");			
				mav.addObject("home_id", inVo.getHome_id());
				mav.addObject("menu_id", inVo.getMenu_id());
				mav.addObject("menu_name", inVo.getMenu_name());
				mav.setViewName("pageView");
			} else if (layoutOutVO.getLink_page() != null) {
				mav.addObject("link_page", layoutOutVO.getLink_page());
				mav.setViewName("linkPage");
			}
		}
		return mav;
	}

}