package kh.mclass.Igre.counselling.model.dao;

import java.util.List;

import kh.mclass.Igre.counselling.model.vo.CounselorWithFileCount;

public interface CounselorDAO {

	List<CounselorWithFileCount> selectCounselorList(int cPage, int numPerPage);

	int selectCounselorTotalContents();

}
