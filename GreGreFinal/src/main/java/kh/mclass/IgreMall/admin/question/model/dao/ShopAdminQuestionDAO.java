package kh.mclass.IgreMall.admin.question.model.dao;

import java.util.List;
import java.util.Map;

import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;

public interface ShopAdminQuestionDAO {

	List<AdminQnA> QnAlist();

	AdminQnA selectQnA(String qaId);

	int answer(Map<String, String> map);

	int updateStatus(Map<String, String> map);

	int totalcount();

	int nTotalcount();

	int yTotalcount();

}
