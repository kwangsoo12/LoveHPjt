package com.loveandheart.LH.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.loveandheart.LH.service.NoticeService;
import com.loveandheart.LH.util.ConfigUtil;
import com.loveandheart.LH.vo.MenuListVO;
import com.loveandheart.LH.vo.NoticeVO;



/**
 * Handles requests for the application home page.
 */
@RestController
public class NoticeController {
	
	@Inject
	NoticeService noticeService;

	@RequestMapping(value="/getPageListNotice") 
	@ResponseBody
	public ModelAndView getPageListNotice(MenuListVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		ModelAndView mav =  new ModelAndView();
		NoticeVO noticeInVO = new NoticeVO();
		noticeInVO.setHome_id(inVo.getHome_id());
		noticeInVO.setMenu_id(inVo.getMenu_id());
		noticeInVO.setPageNo(inVo.getPageNo());
		noticeInVO.setSearch(inVo.getSearch());
		noticeInVO.setKeyWord(inVo.getKeyWord());
		List<NoticeVO> noticeOutVO = noticeService.getPageListNotice(noticeInVO);
		NoticeVO cntOutVO = noticeService.getPageCount(noticeInVO);
			
		mav.addObject("notice", noticeOutVO);
		mav.addObject("cnt", cntOutVO);			
		mav.addObject("home_id", inVo.getHome_id());
		mav.addObject("menu_id", inVo.getMenu_id());
		mav.addObject("menu_name", inVo.getMenu_name());
		mav.addObject("page", inVo.getPageNo()+"");
		mav.setViewName("notice");
		return mav;
	}
	
	@RequestMapping(value="/prcsNotice") 
	@ResponseBody
	public ModelAndView prcsNotice(NoticeVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		

		ModelAndView mav =  new ModelAndView();
		if (inVo.getFlag().equals("I")) {
			String content = inVo.getNotice_content();
			content = content.replaceAll("\r\n", "<br>");
			inVo.setNotice_content(content);
			noticeService.insNotice(inVo);
		} else	if (inVo.getFlag().equals("U")) {
			String content = inVo.getNotice_content();
			content = content.replaceAll("\r\n", "<br>");
			inVo.setNotice_content(content);
			noticeService.updNotice(inVo);
		} else	if (inVo.getFlag().equals("D")) {
			System.out.println("delSeq = " + inVo.getDelSeq());	
			String seqAttr[] = inVo.getDelSeq().split(";");
			for (int i = 0; i < seqAttr.length; i++) {
				inVo.setSeq(Integer.parseInt(seqAttr[i]));
				System.out.println("delSeq>> = " + inVo.getSeq());	
				noticeService.delNotice(inVo);
			}
		}
		List<NoticeVO> noticeOutVO = noticeService.getPageListNotice(inVo);
		NoticeVO cntOutVO = noticeService.getPageCount(inVo);
				
		mav.addObject("notice", noticeOutVO);
		mav.addObject("cnt", cntOutVO);			
		mav.addObject("home_id", inVo.getHome_id());
		mav.addObject("menu_id", inVo.getMenu_id());
		mav.addObject("menu_name", inVo.getMenu_name());
		mav.addObject("page", inVo.getPageNo()+"");
		mav.addObject("flag", inVo.getFlag());
		mav.setViewName("notice");
		return mav;	
	}	
	
	@RequestMapping(value="/getNotice") 
	@ResponseBody
	public ModelAndView getNotice(NoticeVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		ModelAndView mav =  new ModelAndView();
		if (inVo.getFlag().equals("A")) {
			mav.addObject("notice", null);
			mav.addObject("home_id", inVo.getHome_id());
			mav.addObject("menu_id", inVo.getMenu_id());
			mav.addObject("menu_name", inVo.getMenu_name());
			mav.addObject("page", inVo.getPageNo()+"");
			mav.addObject("seq", inVo.getSeq()+"");
			mav.addObject("flag", "A");
			mav.setViewName("noticeWrite");
		} else {
			NoticeVO noticeOutVO = noticeService.getNotice(inVo);
			String content = noticeOutVO.getNotice_content();
			content = content.replaceAll("<br>", "\r\n");
			noticeOutVO.setNotice_content(content);
					
			mav.addObject("notice", noticeOutVO);
			mav.addObject("home_id", inVo.getHome_id());
			mav.addObject("menu_id", inVo.getMenu_id());
			mav.addObject("menu_name", inVo.getMenu_name());
			mav.addObject("page", inVo.getPageNo()+"");
			mav.addObject("seq", inVo.getSeq()+"");
			mav.addObject("flag", "U");
			if (inVo.getFlag().equals("S")) {
				mav.setViewName("noticeRead");
			} else {
				mav.setViewName("noticeWrite");
			}
			
		}

		return mav;	
	}		

}