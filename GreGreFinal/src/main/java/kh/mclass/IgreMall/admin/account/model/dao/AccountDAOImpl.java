package kh.mclass.IgreMall.admin.account.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.mclass.IgreMall.admin.account.model.vo.Account;
import kh.mclass.IgreMall.admin.account.model.vo.PayMethod;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Account> accountList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminAccount.accountList");
	}

	@Override
	public List<PayMethod> pList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminAccount.pList");
	}

	@Override
	public List<Account> searchList(Account a) {
		return sqlSession.selectList("adminAccount.searchList",a);
	}

	@Override
	public List<PayMethod> searchPList(Account a) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminAccount.searchPList",a);
	}
	
	
	
}
