package kh.mclass.Igre.pregnancy.model.service;

import java.util.Map;

import kh.mclass.Igre.member.model.vo.Member;

public interface PregnancyService {

	int findTable(Member memberLoggedIn);

	int insertMenses(Map<String, Object> menses);

}
