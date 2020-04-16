package kh.mclass.IgreMall.admin.info.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.info.model.dao.InfoDAO;
import kh.mclass.IgreMall.admin.info.model.vo.ShopAdmin;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	InfoDAO infoDao; 
	@Override
	public ShopAdmin selectSeller(String sellerId) {
		// TODO Auto-generated method stub
		return infoDao.selectSeller(sellerId);
	}
	@Override
	public int updateAdmin(ShopAdmin s) {
		// TODO Auto-generated method stub
		return infoDao.updateAdmin(s);
	}
	@Override
	public int totalSell() {
		// TODO Auto-generated method stub
		return infoDao.totalSell();
	}
	@Override
	public int totalOrder() {
		// TODO Auto-generated method stub
		return  infoDao.totalOrder();
	}
	@Override
	public int totalQa() {
		// TODO Auto-generated method stub
		return infoDao.totalQa();
	}

}
