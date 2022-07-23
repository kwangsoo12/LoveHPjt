package com.loveandheart.LH.controller;

import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.loveandheart.LH.service.MemberService;
import com.loveandheart.LH.util.ConfigUtil;
import com.loveandheart.LH.vo.MemberVO;




/**
 * Handles requests for the application home page.
 */
@RestController
public class LoginController {
    
	@Inject
	MemberService memberService;
	
	@Autowired
    private HttpSession session;

	@RequestMapping(value="/getLogin") 
	@ResponseBody
	public MemberVO getLogin(MemberVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		byte[] targetBytes = inVo.getPassword().getBytes();
        Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode(targetBytes);
		inVo.setPassword(new String(encodedBytes));

		MemberVO memberOutVO = memberService.getLogin(inVo);
        //HttpSession session = request.getSession();
        //session.setAttribute("memberVO", memberOutVO);
		session.setAttribute("memberVO", memberOutVO);
         
		// mav.addObject("member", memberOutVO);
		return memberOutVO;
	}

	@RequestMapping(value="/insMember") 
	@ResponseBody
	public MemberVO insMember(MemberVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		
		MemberVO memberOutVO = null;
		byte[] targetBytes = inVo.getPassword().getBytes();
        Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode(targetBytes);
		inVo.setPassword(new String(encodedBytes));
		memberOutVO = memberService.insMember(inVo);

		return memberOutVO;
	}
	
	@RequestMapping(value="/getPasswordMember") 
	@ResponseBody
	public MemberVO getPasswordMember(MemberVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		
		
		MemberVO memberOutVO = memberService.getPasswordMember(inVo);
		Decoder decoder = Base64.getDecoder();
		byte[] encodedBytes = memberOutVO.getPassword().getBytes();
        byte[] decodedBytes = decoder.decode(encodedBytes);


		memberOutVO.setPassword(new String(decodedBytes));

		return memberOutVO;
	}
	@RequestMapping(value="/getIdMember") 
	@ResponseBody
	public MemberVO getIdMember(MemberVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		

		byte[] targetBytes = inVo.getPassword().getBytes();
        Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode(targetBytes);
		inVo.setPassword(new String(encodedBytes));	
		
		MemberVO memberOutVO = memberService.getIdMember(inVo);
		return memberOutVO;
	}
	
	@RequestMapping(value="/prcsLogout") 
	@ResponseBody
	public MemberVO prcsLogout(MemberVO inVo){
		inVo.setHome_id(ConfigUtil.getHomeId());		

		session.removeAttribute("memberVO");
		return inVo;
	}
	
}