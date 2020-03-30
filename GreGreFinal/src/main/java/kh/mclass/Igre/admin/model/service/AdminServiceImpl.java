package kh.mclass.Igre.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.mclass.Igre.admin.model.dao.AdminDAO;
import kh.mclass.Igre.admin.model.vo.Admin;
import kh.mclass.Igre.admin.model.vo.Amember;
import kh.mclass.Igre.admin.model.vo.Report;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public Admin selectOne(String adminId) {
		return adminDAO.selectOne(adminId);
	}

	@Override
	public List<Amember> list() {
		return adminDAO.list();
	}

	@Override
	public Amember MemberSelectOne(String memberId) {
		return adminDAO.MemberSelectOne(memberId);
	}
	
	@Override
	public int updateMember(Amember amember) {
		return adminDAO.updateMember(amember);
	}

	@Override
	public int updateAdmin(Amember amember) {
		return adminDAO.updateAdmin(amember);
	}

	@Override
	public int delete(String memberId) {
		return adminDAO.delete(memberId);
	}

	@Override
	public List<Amember> deleteList() {
		return adminDAO.deleteList();
	}

	@Override
	public List<Report> report() {
		return adminDAO.report();
	}

	@Override
	public int postDelete(String boardCode, Integer postNo) {
		return adminDAO.postDelete(boardCode, postNo);
	}

	@Override
	public int reportUpdate(String boardCode, Integer postNo) {
		return adminDAO.reportUpdate(boardCode, postNo);
	}

	@Override
	public int replyDelete(String boardCode, Integer replyNo) {
		return adminDAO.replyDelete(boardCode, replyNo);
	}

	@Override
	public int replyUpdate(String boardCode, Integer postNo, Integer replyNo) {
		return adminDAO.replyUpdate(boardCode, postNo, replyNo);
	}


}
