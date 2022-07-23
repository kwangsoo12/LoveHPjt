package com.loveandheart.LH.dao;

import java.util.List;

import com.loveandheart.LH.vo.NoticeVO;

public interface NoticeDAO {
	public List<NoticeVO> getListNotice(NoticeVO inVO);
	public List<NoticeVO> getListNoticeOrderSeq(NoticeVO inVO);
	public List<NoticeVO> getPageListNotice(NoticeVO inVO);
	public NoticeVO getPageCount(NoticeVO inVO);
	public NoticeVO getNotice(NoticeVO inVO);
	public List<NoticeVO> listNotice(NoticeVO inVO);
	public void insNotice(NoticeVO inVO);
	public void updNotice(NoticeVO inVO);
	public void delNotice(NoticeVO inVO);
}
