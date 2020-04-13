package kh.mclass.IgreMall.admin.info.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.info.model.vo.ShopAdmin;

@Repository
public class InfoDAOImpl implements InfoDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public ShopAdmin selectSeller(String sellerId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shopAdmin.selectSeller",sellerId);
	}

	@Override
	public int updateAdmin(ShopAdmin s) {
		return sqlSession.update("shopAdmin.updateAdmin",s);
	}

}
