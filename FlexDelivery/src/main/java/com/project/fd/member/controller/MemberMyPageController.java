package com.project.fd.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.fd.member.model.MemberService;
import com.project.fd.member.model.MemberVO;
import com.project.fd.member.stores.model.MemberStoresService;
import com.project.fd.member.stores.model.MemberStoresServiceImpl;
import com.project.fd.member.stores.model.MemberStoresVO;

@Controller
@RequestMapping("/member/mypage")
public class MemberMyPageController {
	
	@Autowired
	private static final Logger logger=LoggerFactory.getLogger(MemberMyPageController.class);
	
	@Autowired MemberService memServ;
	@Autowired MemberStoresService storeServ;
	
	@RequestMapping("/main.do")
	public void mypage(Model model,HttpSession session){
		String memberId=(String)session.getAttribute("memberId");
		logger.info("1:1문의 내역 보여주기,세션에 저장된 memberId={}",memberId);
		MemberVO vo=memServ.selectMember(memberId);
		String authorityName=memServ.selectAuth(vo.getAuthorityNo());
		model.addAttribute("vo",vo);
		model.addAttribute("authorityName",authorityName);
		
	}
	
	@RequestMapping("/myLikeStore.do")
	public String myLikeStore(HttpSession session,Model model) {
		int memberNo=(Integer)session.getAttribute("memberNo");
		List<MemberStoresVO> list=storeServ.likeStoreList(memberNo);
		model.addAttribute("list",list);
		
		return "member/mypage/myLikeStore";
	}
	
}
