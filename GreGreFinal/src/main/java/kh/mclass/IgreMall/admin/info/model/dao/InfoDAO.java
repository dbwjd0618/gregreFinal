package kh.mclass.IgreMall.admin.info.model.dao;

import kh.mclass.IgreMall.admin.info.model.vo.ShopAdmin;

public interface InfoDAO {

	ShopAdmin selectSeller(String sellerId);

	int updateAdmin(ShopAdmin s);

}
