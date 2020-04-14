package kh.mclass.IgreMall.wish.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.IgreMall.wish.model.dao.WishDAO;
import kh.mclass.IgreMall.wish.model.vo.Wish;

@Service
public class WishServiceImpl implements WishService {
	@Autowired
	WishDAO wishDAO;

	@Override
	public Wish selectWishOne(Wish wish) {
		return wishDAO.selectWishOne(wish);
	}

	@Override
	public int updateWishCheck(Wish wish) {
		return wishDAO.updateWishCheck(wish);
	}

	@Override
	public int insertWish(Wish wish) {
		return wishDAO.insertWish(wish);
	}

	@Override
	public List<Wish> selectWishList(String memberId) {
		return wishDAO.selectWishList(memberId);
	}

	@Override
	public int deleteWishOne(Wish wish) {
		return wishDAO.deleteWishOne(wish);
	}

	
}
