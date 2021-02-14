package com.project.fd.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.member.ask.model.MemberAskService;
import com.project.fd.member.ask.model.MemberAskVO;
import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;

@Controller
@RequestMapping("/member/ask")
public class MemberAskController {
	@Autowired private static final Logger logger=LoggerFactory.getLogger(MemberAskController.class);
	
	@Autowired MemberAskService memberAskService;
	
	@RequestMapping("/askList.do")
	public void askList(Model model,HttpSession session) {
		logger.info("1:1문의 리스트 보여주기");
	}
	
	@RequestMapping(value = "/askWrite.do", method=RequestMethod.POST)
	public String askWrite(@ModelAttribute MemberAskVO memberAskVo, 
			HttpServletRequest request) {
		logger.info("1:1 글쓰기 처리, 파라미터 vo={}",memberAskVo);
		
		
		
		//2
		int cnt = memberAskService.askWrite(memberAskVo);
		logger.info("1:1 글쓰기 처리 결과, cnt={}", cnt);
		
		return "/member/ask/askList";
	}
	
}
