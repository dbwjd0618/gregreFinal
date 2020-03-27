package kh.mclass.Igre.counselling.model.service;

import java.util.List;

import kh.mclass.Igre.counselling.model.vo.CounselorWithFileCount;

public interface CounselorService {

	List<CounselorWithFileCount> selectCounselorList(int cPage, int numPerPage);

	int selectCounselorTotalContents();

}
