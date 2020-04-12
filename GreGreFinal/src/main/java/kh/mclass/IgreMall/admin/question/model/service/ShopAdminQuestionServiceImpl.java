package kh.mclass.IgreMall.admin.question.model.service;

import java.util.List;

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
	
}
