package kh.mclass.IgreMall.admin.question.model.service;

import java.util.List;
import java.util.Map;

import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;

public interface ShopAdminQuestionService {

	List<AdminQnA> QnAlist();

	AdminQnA selectQnA(String qaId);

	int answer(Map<String, String> map);

	int updateState(Map<String, String> map);

	int totalcount();

	int ntotalcount();

	int ytotalcount();

}
