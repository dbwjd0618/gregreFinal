package kh.mclass.IgreMall.admin.question.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kh.mclass.IgreMall.admin.question.model.dao.ShopAdminQuestionDAO;
import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;

@Controller
public class ShopAdminQuestionServiceImpl implements ShopAdminQuestionService {

	@Autowired
	ShopAdminQuestionDAO questionDao;

	@Override
	public List<AdminQnA> QnAlist() {
		return questionDao.QnAlist();
		
	}

	@Override
	public AdminQnA selectQnA(String qaId) {
		// TODO Auto-generated method stub
		return questionDao.selectQnA(qaId);
	}

	@Override
	public int answer(Map<String, String> map) {
		// TODO Auto-generated method stub
		return questionDao.answer(map);
	}

	@Override
	public int updateState(Map<String, String> map) {
		// TODO Auto-generated method stub
		return questionDao.updateStatus(map);
	}

	@Override
	public int totalcount() {
		// TODO Auto-generated method stub
		return questionDao.totalcount();
	}

	@Override
	public int ntotalcount() {
		// TODO Auto-generated method stub
		return questionDao.nTotalcount();
	}

	@Override
	public int ytotalcount() {
		// TODO Auto-generated method stub
		return questionDao.yTotalcount();
	}
	
}
