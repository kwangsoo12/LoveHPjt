package com.loveandheart.LH.dao;

import java.util.List;

import com.loveandheart.LH.vo.GalleryVO;
import com.loveandheart.LH.vo.LayoutVO;
import com.loveandheart.LH.vo.MenuListVO;

public interface MenuDAO {
	public List<MenuListVO> getListMenu(MenuListVO inVO);
	public LayoutVO getLayout(LayoutVO inVO);
	public List<GalleryVO> getListGallery(GalleryVO inVO);
}
