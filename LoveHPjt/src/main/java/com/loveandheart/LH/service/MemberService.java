package com.loveandheart.LH.service;

import com.loveandheart.LH.vo.MemberVO;

public interface MemberService {
	public MemberVO getLogin (MemberVO inVO);
	public MemberVO insMember (MemberVO inVO);
	public MemberVO getPasswordMember (MemberVO inVO);
	public MemberVO getIdMember (MemberVO inVO);
}
