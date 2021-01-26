package com.project.fd.owner.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.advertise.model.OwnerAdvertiseService;
import com.project.fd.owner.ownerregister.model.OwnerRegisterService;
import com.project.fd.owner.ownerregister.model.OwnerRegisterVO;


@Controller
@RequestMapping("/owner/menu2")
public class OwnerAdminAgreeListcontroller {
	private static final Logger logger
	=LoggerFactory.getLogger(OwnerReviewController.class);
	
	@Autowired private OwnerRegisterService ownerRService;
	@Autowired private FileUploadUtil fileUtil;
	@Autowired private OwnerAdvertiseService ownerAdvertiseService;
	
	
	// 승인 신청 목록 불러오기 세션의 오너넘버로 조회 
			@RequestMapping("/temporary/tempList.do")
			public String tempList(HttpSession session,
					Model model) {
				//int ownerNo=(Integer) session.getAttribute("ownerNo");
				int ownerNo=1;
				logger.info("승인 신청  목록 조회, 파라미터 ownerNo = {}", ownerNo);
				
				List<Map<String, Object>> tempList =ownerRService.selectLSJAgreeListView(ownerNo);
				logger.info("승인 대기  목록 조회 결과, tempList.size={}", tempList.size());

				model.addAttribute("tempList", tempList);
				
				return "owner/menu2/temporary/tempList";
			}
	
			
			// 딜리트 아니고 업데이트 2번으로 모드 에 따라서 처리하기 
			@RequestMapping(value="/tempDelete.do", method = RequestMethod.GET)
			public String temp_Delete(
					@RequestParam(defaultValue = "0") int no,
				@RequestParam String mode,
				HttpSession session,
					Model model){
				int ownerNo=1;
				//int ownerNo=(Integer) session.getAttribute("ownerNo");
				logger.info("승인 신청  목록 조회, 파라미터 ownerNo = {}", ownerNo);
				logger.info("승인 신청 리스트 업데이트 페이지 mode={},no={}",mode,no);
				int cnt=0;
				if(mode.equals("stores")) {
					
				}else if(mode.equals("btAd")) {
					//cnt=ownerRService.updateAgreeAd(storeadNo); //update로 변경하기
				}else if(mode.equals("btRegi")) {
					//  파라미터 O_REGISTER_NO 
				OwnerRegisterVO vo=new OwnerRegisterVO();
				vo.setOwnerNo(ownerNo);
				vo.setoRegisterNo(no);
					cnt=ownerRService.updateAgreeRegi(vo);
					logger.info("사업자등록증 목록에서 업데이트2 성 여부 cnt={}",cnt);
				}
				
				//1. 파라미터
				logger.debug(" 취소 , 파라미터: storeadNo={}",no );
				
				//2. db작업
				String msg="신청 취소  실패", 
						url="/owner/menu2/temporary/tempList.do";
				if(cnt>0) {
					msg="취소 처리 성공 ";
				}
				
				
				//3
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);

				//4
				return "common/message";
			}
	/* @RequestMapping(value="/temporary/tempList.do",method=RequestMethod.GET)
	 public void TempList_get() {
		 logger.info("점포 - 승인 목록 조회  화면");
	 }
	 */
	 //datapicker 사용 리스트 조회
	/* 
	 @RequestMapping("/temporary/tempList.do")
		public String adminAgreeList(@ModelAttribute DateSearchVO searchVo,
				HttpSession session, Model model) {
			String ownerId=(String) session.getAttribute("ownerId"); //사업자ID
			searchVo.setCustomerId(ownerId);		
			logger.info("adminAgreeListTempList , 파라미터 searchVo={}", searchVo);
			
			//[1]
			PaginationInfo pagingInfo = new PaginationInfo();
			//pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			pagingInfo.setCurrentPage(searchVo.getCurrentPage());
			
			//[2]
			searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			
			//날짜가 넘어오지 않은 경우 현재일자를 셋팅
			String startDay=searchVo.getStartDay();
			if(startDay==null || startDay.isEmpty()) {
				Date d = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String today=sdf.format(d);
				searchVo.setStartDay(today);
				searchVo.setEndDay(today);			
			}
			
			List<OwnerAllRegisterVO> tempList=ownerRService.selectTempList(searchVo);
			logger.info("tempList조회 결과, tempList.size={}", tempList.size());
			
			int totalRecord=ownerRService.getTotalRecord(searchVo);
			logger.info("tempList-레코드 개수 조회 결과, totalRecord={}", totalRecord);
			
			pagingInfo.setTotalRecord(totalRecord);
			
			model.addAttribute("tempList", tempList);
			model.addAttribute("pagingInfo", pagingInfo);
			//model.addAttribute("dateSearchVO", searchVo);
			
			
			return "owner/menu2/temporary/tempList";
	 }
			*/
	 
	 
	 
		
	 /*
		@RequestMapping("/detail.do")
		public String temp_detail(@RequestParam(defaultValue = "0") int no,
				HttpServletRequest request, Model model) {
			//1
			logger.info("사업자등록증 신청  상세보기 파라미터 no={}", no);
			if(no==0) {
				model.addAttribute("msg", "잘못된 url입니다.");
				model.addAttribute("url", "/reBoard/list.do");

				return "common/message";
			}

			//2
			OwnerRegisterVO ownerRegisterVO=ownerRService.selectByNo(no);
			logger.info("상세보기 결과,ownerRegisterVO={}", ownerRegisterVO);

			String fileInfo
			=ownerRService.getFileInfo(ownerRegisterVO.getoRegisterOriginalFileName() 
					, request);
			logger.info("fileInfo={}", fileInfo);

			//3
			model.addAttribute("vo", ownerRegisterVO);
			model.addAttribute("fileInfo", fileInfo);

			//4
			return "";
		} */
		
	
}

