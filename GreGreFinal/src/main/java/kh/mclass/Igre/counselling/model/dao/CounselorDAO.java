package kh.mclass.Igre.counselling.model.dao;

import java.util.List;

import kh.mclass.Igre.counselling.model.vo.Counselor;

public interface CounselorDAO {

	int selectCounselorTotalContents();

	List<Counselor> selectCounselorList(int cPage, int numPerPage);

}
