package com.project.fd.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;

@Controller
@RequestMapping("/member/ask")
public class MemberAskController {
	@Autowired private static final Logger logger=LoggerFactory.getLogger(MemberAskController.class);
	
	@Autowired MemberService memServ;
	
	@RequestMapping("/askList.do")
	public void askList(Model model,HttpSession session) {
		logger.info("1:1문의 리스트 보여주기");
	}
}
