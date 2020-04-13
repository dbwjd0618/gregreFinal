package kh.mclass.IgreMall.admin.coupon.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.admin.coupon.model.dao.AdminCouponDAO;
import kh.mclass.IgreMall.admin.coupon.model.vo.AdminCoupon;
import kh.mclass.IgreMall.admin.coupon.model.vo.CouponPeople;

@Service
public class AdminCouponServiceImpl implements AdminCouponService {

	@Autowired
	AdminCouponDAO adminCouponDao;

	@Override
	public int insertCoupon(AdminCoupon c) {
		// TODO Auto-generated method stub
		return adminCouponDao.insertCoupon(c);
	}

	@Override
	public List<AdminCoupon> couponList() {
		return adminCouponDao.couponList();
	}

	@Override
	public AdminCoupon selectCoupon(AdminCoupon a) {
		// TODO Auto-generated method stub
		return adminCouponDao.selectCoupon(a);
	}

	@Override
	public int sendCoupon(CouponPeople cp) {
		// TODO Auto-generated method stub
		return adminCouponDao.sendCoupon(cp);
	}

	@Override
	public AdminCoupon selectcurCoupon(AdminCoupon c) {
		// TODO Auto-generated method stub
		return adminCouponDao.selectcurCoupon(c);
	}
	
}
