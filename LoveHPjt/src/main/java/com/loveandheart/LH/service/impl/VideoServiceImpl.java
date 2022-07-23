package com.loveandheart.LH.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.loveandheart.LH.service.VideoService;
import com.loveandheart.LH.vo.VideoVO;

//@Service
@Repository
public class VideoServiceImpl implements VideoService {
	@Inject
	com.loveandheart.LH.dao.VideoDAO videoDao;
	//private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.loveandheart.LH.dao.VideoDAO";
	
	@Override
	public List<VideoVO> mainVideo() {
		// return sqlSession.selectList(NAMESPACE + ".mainVideo");
		return videoDao.mainVideo();
	}
}
