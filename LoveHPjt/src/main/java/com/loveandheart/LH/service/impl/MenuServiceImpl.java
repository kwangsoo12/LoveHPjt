package com.loveandheart.LH.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.loveandheart.LH.dao.MenuDAO;
import com.loveandheart.LH.service.MenuService;
import com.loveandheart.LH.vo.GalleryVO;
import com.loveandheart.LH.vo.LayoutVO;
import com.loveandheart.LH.vo.MenuListVO;

@Service
public class MenuServiceImpl implements MenuService {
	@Inject
	MenuDAO menuDao;

	@Override
	public List<MenuListVO> getListMenu(MenuListVO inVO) {
		return menuDao.getListMenu(inVO);
	}	
	@Override
	public LayoutVO getLayout(LayoutVO inVO) {
		return menuDao.getLayout(inVO);
	}	
	@Override
	public List<GalleryVO> getListGallery(GalleryVO inVO) {
		return menuDao.getListGallery(inVO);
	}
}
