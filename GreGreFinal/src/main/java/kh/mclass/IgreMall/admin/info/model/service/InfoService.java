package kh.mclass.IgreMall.admin.info.model.service;

import kh.mclass.IgreMall.admin.info.model.vo.ShopAdmin;

public interface InfoService {

	ShopAdmin selectSeller(String sellerId);

	int updateAdmin(ShopAdmin s);

	int totalSell();

	int totalOrder();

	int totalQa();

}
