package com.loveandheart.LH.service;

import java.util.List;

import com.loveandheart.LH.vo.GalleryVO;
import com.loveandheart.LH.vo.LayoutVO;
import com.loveandheart.LH.vo.MenuListVO;
import com.loveandheart.LH.vo.NoticeVO;

public interface MenuService {
	public List<MenuListVO> getListMenu (MenuListVO inVO);
	public LayoutVO getLayout (LayoutVO inVO);
	public List<GalleryVO> getListGallery (GalleryVO inVO);
}
