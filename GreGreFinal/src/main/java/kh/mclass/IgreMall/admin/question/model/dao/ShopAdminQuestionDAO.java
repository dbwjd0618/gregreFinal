package kh.mclass.IgreMall.admin.question.model.dao;

import java.util.List;

import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;

public interface ShopAdminQuestionDAO {

	List<AdminQnA> QnAlist();

	AdminQnA selectQnA(String qaId);

}
