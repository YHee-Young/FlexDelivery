package com.project.fd.member.stores.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.fd.admin.largecategory.model.AdminLargeCategoryVO;
import com.project.fd.owner.menu.model.OwnerStoreMenuGroupVO;

@Service
public class MemberStoresServiceImpl implements MemberStoresService{
	
	@Autowired private MemberStoresDAO memStoresDao;

	@Override
	public List<MemberStoresVO> selectFlexAdStores(Map<String, Object> map) {
		return memStoresDao.selectFlexAdStores(map);
	}

	@Override
	public List<MemberStoresVO> selectOpenAdStores(Map<String, Object> map) {
		return memStoresDao.selectOpenAdStores(map);
	}

	@Override
	public List<AdminLargeCategoryVO> categorySlider() {
		return memStoresDao.categorySlider();
	}

	@Override
	public List<MemberStoresVO> selectAllStores(Map<String, Object> map) {
		return memStoresDao.selectAllStores(map);
	}

	@Override
	public int selectAllStoresCount(Map<String, Object> map) {
		return memStoresDao.selectAllStoresCount(map);
	}

	@Override
	public MemberStoresVO selectStoresDetail(int storeNo) {
		return memStoresDao.selectStoresDetail(storeNo);
	}

	@Override
	public List<MemberLikeStoreVO> selectLikeStore(int memberNo) {
		return memStoresDao.selectLikeStore(memberNo);
	}
}
