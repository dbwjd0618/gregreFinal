package kh.mclass.IgreMall.admin.account.model.service;

import java.util.List;

import kh.mclass.IgreMall.admin.account.model.vo.Account;
import kh.mclass.IgreMall.admin.account.model.vo.PayMethod;
import kh.mclass.IgreMall.admin.coupon.model.vo.ChartValue;

public interface AccountService {

	List<Account> Accountlist();

	List<PayMethod> plist();

	List<Account> searchList(Account a);

	List<PayMethod> searchplist(Account a);

	List<ChartValue> clist();

}
