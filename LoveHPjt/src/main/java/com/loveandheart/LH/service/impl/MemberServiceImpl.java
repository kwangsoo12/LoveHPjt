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
			outVO.setStatCode("E001"); // ID�� PASSWORD�� Ȯ�� �ϼ���
		} else {
			outVO.setStatCode("0000"); // ���������� �α��� �Ǿ����ϴ�.
		}
		return outVO;
	}	
	@Override
	public MemberVO insMember(MemberVO inVO) {
		MemberVO outVO = new MemberVO();
		try {
			memberDao.insMember(inVO);
			outVO.setStatCode("0000"); // ���������� �α��� �Ǿ����ϴ�.
		} catch (DuplicateKeyException e) {
			outVO.setStatCode("E002"); // ��ϵ� ȸ���Դϴ�
		//} catch (BindingException e) {
		//	outVO.setStatCode("E004"); // ������ �߸� �Ǿ����ϴ�	
		/*	
		} catch (Exception e) {
			outVO.setStatCode("E003"); // �Է��Ͻ� �����Ͱ��� ũ�� �ʹ� Ů�ϴ�
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
			outVO.setStatCode("0000"); // ���������� �α��� �Ǿ����ϴ�.
		} catch (Exception e) {
			outVO = new MemberVO();
			outVO.setStatCode("E001"); // ��ϵ� ȸ���� �����ϴ�.
		}

		return outVO;
	}	
	@Override
	public MemberVO getIdMember(MemberVO inVO) {
		MemberVO outVO = null;
		try {
			outVO = memberDao.getIdMember(inVO);
			outVO.setStatCode("0000"); // ���������� �α��� �Ǿ����ϴ�.
		} catch (Exception e) {
			outVO = new MemberVO();
			outVO.setStatCode("E001"); // ��ϵ� ȸ���� �����ϴ�.
		}

		return outVO;
	}	

}
