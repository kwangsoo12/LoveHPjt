package com.loveandheart.LH.vo;

public class MenuListVO {
	private String home_id;
	private String menu_level;
	private String menu_id;
	private String menu_name;
	private String link_page;
	private String top_menu_id;
	private String search;
	private String keyWord;
	
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	private int pageNo;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String getTop_menu_id() {
		return top_menu_id;
	}
	public void setTop_menu_id(String top_menu_id) {
		this.top_menu_id = top_menu_id;
	}
	public String getHome_id() {
		return home_id;
	}
	public void setHome_id(String home_id) {
		this.home_id = home_id;
	}
	public String getMenu_level() {
		return menu_level;
	}
	public void setMenu_level(String menu_level) {
		this.menu_level = menu_level;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getLink_page() {
		return link_page;
	}
	public void setLink_page(String link_page) {
		this.link_page = link_page;
	}

	
}
