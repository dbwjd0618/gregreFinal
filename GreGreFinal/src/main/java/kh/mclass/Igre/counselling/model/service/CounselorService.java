package kh.mclass.Igre.counselling.model.service;

import java.util.List;

import kh.mclass.Igre.counselling.model.vo.Counselor;

public interface CounselorService {

	int selectCounselorTotalContents();

	List<Counselor> selectCounselorList(int cPage, int numPerPage);

	Counselor selectOne(String advisId);

}
