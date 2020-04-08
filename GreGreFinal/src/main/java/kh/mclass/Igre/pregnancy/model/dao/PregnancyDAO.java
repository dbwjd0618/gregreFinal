package kh.mclass.Igre.pregnancy.model.dao;

import java.util.Map;

import kh.mclass.Igre.member.model.vo.Member;

public interface PregnancyDAO {

	int findTable(Member memberLoggedIn);

	int insertMenses(Map<String, Object> menses);

}
