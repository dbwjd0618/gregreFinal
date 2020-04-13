package kh.mclass.IgreMall.admin.question.model.service;

import java.util.List;

import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;

public interface ShopAdminQuestionService {

	List<AdminQnA> QnAlist();

	AdminQnA selectQnA(String qaId);

}
