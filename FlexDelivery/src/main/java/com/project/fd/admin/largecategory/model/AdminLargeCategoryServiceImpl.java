package com.project.fd.admin.largecategory.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.common.SearchVO;

@Service
public class AdminLargeCategoryServiceImpl implements AdminLargeCategoryService{
	@Autowired
	private AdminLargeCategoryDAO largecategoryDao;
	
	@Override
	public List<AdminLargeCategoryVO> selectAll() {
		return largecategoryDao.selectAll();
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return largecategoryDao.selectTotalRecord(searchVo);
	}

	@Override
	public AdminLargeCategoryVO selectByNo(int no) {
		return largecategoryDao.selectByNo(no);
	}

	@Override
	public int insertLargeCategory(AdminLargeCategoryVO largecategoryVo) {
		return largecategoryDao.insertLargeCategory(largecategoryVo);
	}

	@Override
	public int updateLargeCategory(AdminLargeCategoryVO largecategoryVo) {
		return largecategoryDao.updateLargeCategory(largecategoryVo);
	}

	
}
