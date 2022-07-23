package com.loveandheart.LH.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.loveandheart.LH.dao.NoticeDAO;
import com.loveandheart.LH.service.NoticeService;
import com.loveandheart.LH.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Inject
	NoticeDAO noticeDao;

	@Override
	public List<NoticeVO> getListNotice(NoticeVO inVO) {
		return noticeDao.getListNotice(inVO);
	}
	@Override
	public List<NoticeVO> getListNoticeOrderSeq(NoticeVO inVO) {
		return noticeDao.getListNoticeOrderSeq(inVO);
	}
	@Override
	public List<NoticeVO> getPageListNotice(NoticeVO inVO) {
		return noticeDao.getPageListNotice(inVO);
	}
	@Override
	public NoticeVO getPageCount(NoticeVO inVO) {
		return noticeDao.getPageCount(inVO);
	}
	@Override
	public NoticeVO getNotice(NoticeVO inVO) {
		return noticeDao.getNotice(inVO);
	}
	@Override
	public List<NoticeVO> listNotice(NoticeVO inVO) {
		return noticeDao.listNotice(inVO);
	}
	@Override
	public void insNotice(NoticeVO inVO) {
		noticeDao.insNotice(inVO);
	}
	@Override
	public void updNotice(NoticeVO inVO) {
		noticeDao.updNotice(inVO);
	}
	@Override
	public void delNotice(NoticeVO inVO) {
		noticeDao.delNotice(inVO);
	}
	
}
