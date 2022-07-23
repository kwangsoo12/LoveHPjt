package com.loveandheart.LH.dao;

import com.loveandheart.LH.vo.MemberVO;

public interface MemberDAO {
	public MemberVO getLogin(MemberVO inVO);
	public MemberVO insMember(MemberVO inVO);
	public MemberVO getPasswordMember(MemberVO inVO);
	public MemberVO getIdMember(MemberVO inVO);
}
