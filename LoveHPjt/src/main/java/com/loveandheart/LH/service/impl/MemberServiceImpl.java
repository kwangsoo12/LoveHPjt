package com.loveandheart.LH.service.impl;

import javax.inject.Inject;

import org.apache.ibatis.binding.BindingException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import com.loveandheart.LH.dao.MemberDAO;
import com.loveandheart.LH.service.MemberService;
import com.loveandheart.LH.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO memberDao;

	@Override
	public MemberVO getLogin(MemberVO inVO) {
		MemberVO outVO = memberDao.getLogin(inVO);
		if (outVO == null) {
			outVO = new MemberVO();
			outVO.setStatCode("E001"); // ID와 PASSWORD를 확인 하세요
		} else {
			outVO.setStatCode("0000"); // 정상적으로 로그인 되었습니다.
		}
		return outVO;
	}	
	@Override
	public MemberVO insMember(MemberVO inVO) {
		MemberVO outVO = new MemberVO();
		try {
			memberDao.insMember(inVO);
			outVO.setStatCode("0000"); // 정상적으로 로그인 되었습니다.
		} catch (DuplicateKeyException e) {
			outVO.setStatCode("E002"); // 등록된 회원입니다
		//} catch (BindingException e) {
		//	outVO.setStatCode("E004"); // 매핑이 잘못 되었습니다	
		/*	
		} catch (Exception e) {
			outVO.setStatCode("E003"); // 입력하신 데이터값의 크기 너무 큽니다
			System.out.println("$$$$$$$$$$$$$$$$$$$$$");
			System.out.println(e);
		*/
		}

		return outVO;
	}	
	@Override
	public MemberVO getPasswordMember(MemberVO inVO) {
		MemberVO outVO = null;
		try {
			outVO = memberDao.getPasswordMember(inVO);
			outVO.setStatCode("0000"); // 정상적으로 로그인 되었습니다.
		} catch (Exception e) {
			outVO = new MemberVO();
			outVO.setStatCode("E001"); // 등록된 회원이 없습니다.
		}

		return outVO;
	}	
	@Override
	public MemberVO getIdMember(MemberVO inVO) {
		MemberVO outVO = null;
		try {
			outVO = memberDao.getIdMember(inVO);
			outVO.setStatCode("0000"); // 정상적으로 로그인 되었습니다.
		} catch (Exception e) {
			outVO = new MemberVO();
			outVO.setStatCode("E001"); // 등록된 회원이 없습니다.
		}

		return outVO;
	}	

}
