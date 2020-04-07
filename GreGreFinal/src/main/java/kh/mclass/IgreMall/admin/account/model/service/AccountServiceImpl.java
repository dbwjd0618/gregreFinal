package kh.mclass.IgreMall.admin.account.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.account.model.dao.AccountDAO;
import kh.mclass.IgreMall.admin.account.model.vo.Account;
import kh.mclass.IgreMall.admin.account.model.vo.PayMethod;

@Service
public class AccountServiceImpl implements AccountService {

	@Autowired
	AccountDAO accountDao;

	@Override
	public List<Account> Accountlist() {
		// TODO Auto-generated method stub
		return accountDao.accountList();
	}

	@Override
	public List<PayMethod> plist() {
		// TODO Auto-generated method stub
		return accountDao.pList();
	}
	
	
	
}
