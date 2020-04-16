package kh.mclass.Igre.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.common.util.Utils;
import kh.mclass.Igre.member.model.service.MemberService;
import kh.mclass.Igre.member.model.vo.Advis;
import kh.mclass.Igre.member.model.vo.BizMember;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.member.model.vo.Seller;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
@SessionAttributes(value = {"memberLoggedIn","bizmemberLoggedIn"})

public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	ServletContext servletContext;
	@Autowired
	ResourceLoader resourceLoader;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@GetMapping("/login.do")
	public String login(HttpSession session, HttpServletRequest request) {
		try {
			Member m = (Member) session.getAttribute("memberLoggedIn");
			m.getMemberId().equals(null);
		} catch (NullPointerException e) {
			session.setAttribute("referer", request.getHeader("referer"));
			return "member/login";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/";
	}
	
	@PostMapping("/login.do")
	public String login(@RequestParam("memberId") String memberId, @RequestParam("memberPwd") String memberPwd,
					Model model, RedirectAttributes rda) {
		try {
			Member m = ms.selectId(memberId);
			
			if (m != null && bcryptPasswordEncoder.matches(memberPwd,m.getMemberPwd())) {
				HashMap<String, ArrayList<Integer>> preferList = ms.preferList(memberId);
				m.setPrefList(preferList);
				log.debug("" + m);
				model.addAttribute("memberLoggedIn", m);
			} else {
				rda.addFlashAttribute("msg", "입력 정보가 올바르지 않습니다.");
				return "redirect:/member/login.do";
			}
		} catch (Exception e) {
			rda.addFlashAttribute("msg", "로그인 도중 오류가 발생했습니다.");
			e.printStackTrace();
			return "redirect:/";
		}
		return "redirect:/";
	}

	/*
	 * @GetMapping("bizlogin.do") public String bizlogin(HttpSession session) { try
	 * { BizMember bm = (BizMember) session.getAttribute("bizmemberLoggedIn");
	 * bm.getCmemberId().equals(null); } catch (NullPointerException e) { return
	 * "member/login"; } catch (Exception e) { e.printStackTrace(); } return
	 * "redirect:/"; }
	 */

	@PostMapping("/bizlogin.do")
	public String bizlogin(@RequestParam("cmemberId") String cmemberId, @RequestParam("memberPwd") String memberPwd,
			Model model, RedirectAttributes rda) {
		BizMember bm = ms.selectBizId(cmemberId);
		try {
			if (bm != null && bcryptPasswordEncoder.matches(memberPwd,bm.getMemberPwd())) {
				model.addAttribute("bizmemberLoggedIn", bm);
			} else {
			rda.addFlashAttribute("msg", "입력 정보가 올바르지 않습니다.");
			return "redirect:/";
			}
		} catch (Exception e) {
			rda.addFlashAttribute("msg", "로그인 도중 오류가 발생했습니다.");
			e.printStackTrace();
			return "redirect:/";
		}
		if(bm.getCompDiv().equals("S")) {
			
			return "redirect:/shop/admin/index.do";
		}
		else {
			return "redirect:/";
		}
	}


	@GetMapping("/logout.do")
	public String logout(SessionStatus ss, HttpServletRequest request, HttpSession session) {
		if (!ss.isComplete())
			ss.setComplete();
		String referer = request.getHeader("referer");
		session.setAttribute("referer", referer);
		log.debug("referer = " + referer);
		return "redirect:"+referer;
	}

	// --------------------상욱--------------------

	@GetMapping("/passwordChoiceView.do")
	public ModelAndView passwordChoiceView(ModelAndView mav) {

		mav.setViewName("member/passwordChoiceView");

		return mav;
	}

	@GetMapping("/enrollChoiceView.do")
	public ModelAndView enrollChoiceView(ModelAndView mav) {

		mav.setViewName("member/enrollChoiceView");

		return mav;
	}

	@GetMapping("/enrollChoiceView2.do")
	public ModelAndView enrollChoiceView2(ModelAndView mav) {

		mav.setViewName("member/enrollChoiceView2");

		return mav;
	}

	@GetMapping("/memberEnroll.do")
	public ModelAndView memberEnroll(ModelAndView mav) {

		mav.setViewName("member/memberEnroll");

		return mav;
	}

	@GetMapping("/bizEnroll.do")
	public ModelAndView bizEnroll(ModelAndView mav) {

		mav.setViewName("member/bizEnroll");

		return mav;
	}

	@GetMapping("/sellerEnroll.do")
	public ModelAndView sellerEnroll(ModelAndView mav) {

		mav.setViewName("member/sellerEnroll");

		return mav;
	}

	@PostMapping("/memberEnroll.do")
	public String memberEnrollP(Member member, RedirectAttributes ras, String addr1, String addr2, String addr3 ,String mateId,String childNumber) {

		String rawPassword = member.getMemberPwd();
		log.debug("암호화전=",rawPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		log.debug("암호화후=",encryptPassword);
		member.setMemberPwd(encryptPassword);
		System.out.println("암호화 처리 확인 : ");
		String address = addr1 +"+"+ addr2 +"+"+ addr3;

		member.setAddress(address);
		int result = ms.enroll(member);
		String msg = result > 0 ? "회원가입 완료!" : "";
		ras.addFlashAttribute("msg", msg);

		return "redirect:/";

	}

	@PostMapping("/sellerEnroll.do")
	public String sellerEnrollP(BizMember bizmember, Seller seller, RedirectAttributes ras, String addr1, String addr2,
			String addr3, String compId1, String compId2, String compId3, String[] categories) {

		String address = addr1 +"+"+ addr2 +"+"+ addr3;
		String compId = compId1 + compId2 + compId3;
		String categorieslist = "";

		
		String rawPassword =bizmember.getMemberPwd();
		log.debug("암호화전=",rawPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		log.debug("암호화후=",encryptPassword);
		bizmember.setMemberPwd(encryptPassword);
		
		for (int i = 0; i < categories.length; i++) {
			categorieslist += (i == categories.length - 1 ? categories[i] : categories[i] + ",");

		}
		System.out.println("categoriesList=" + categorieslist);
		seller.setSalesCategories(categorieslist);
		seller.setCompId(compId);
		seller.setCompAddress(address);
		int result = ms.sellerEnroll(bizmember, seller);
		String msg = result > 0 ? "회원가입 완료!" : "누락된 항목이 있습니다";
		ras.addFlashAttribute("msg", msg);

		return "redirect:/shop/shop.do";

	}

	@PostMapping("/bizEnroll.do")
	public String bizEnrollA(BizMember bizmember, Advis advis,
			@RequestParam(value = "upFile", required = false) MultipartFile[] upFiles, HttpServletRequest request,
			RedirectAttributes redirectAttributes, String advisKeyword1, String advisKeyword2, String advisKeyword3) {

		
		String rawPassword =bizmember.getMemberPwd();
		log.debug("암호화전=",rawPassword);
		
		String encryptPassword = bcryptPasswordEncoder.encode(rawPassword);
		log.debug("암호화후=",encryptPassword);
		bizmember.setMemberPwd(encryptPassword);
		
		
		String advisKeywordlist = advisKeyword1 + "," + advisKeyword2 + "," + advisKeyword3;
		String adimg1 = upFiles[0].getOriginalFilename();
		String adimg2 = upFiles[1].getOriginalFilename();
		advis.setAdvisImg(adimg1);
		advis.setAdvislicenseFile(adimg2);
		advis.setAdvisKeyword(advisKeywordlist);
		try {

			for (MultipartFile f : upFiles) {

				if (f.isEmpty())
					continue;

				String originalFileName = f.getOriginalFilename();
				String renamedFileName = Utils.getRenamedFileName(originalFileName);

				String saveDirectory = request.getServletContext().getRealPath("/resources/upload/member");

				try {
					f.transferTo(new File(saveDirectory, renamedFileName));
				} catch (IllegalStateException | IOException e)

				{ // TODO Auto-generated catch block
					e.printStackTrace();
				}

			int result = ms.bizEnroll(bizmember, advis);

			redirectAttributes.addFlashAttribute("msg", result > 0 ? "등록성공!" : "등록실패!");
			}

		} catch (Exception e) {
			log.error("게시판 등록 오류!", e);
		}
		return "redirect:/member/login.do";
	}

	@GetMapping("/{memberId}/checkId.do")
	@ResponseBody
	public Map<String,Object> checkId2(@PathVariable("memberId") String memberId,Model model) {
		
		Map<String,Object> map = new HashMap<>();
		
		boolean isUsable = ms.selectOne(memberId)==null?true:false; 
		
		map.put("isUsable",isUsable);
		
		
		return map;
	}
	  
	@GetMapping("/{cmemberId}/checkcId.do")
	@ResponseBody
	public Map<String,Object> checkid3(@PathVariable("cmemberId")String cmemberId,Model model){
		
		Map<String,Object> cmap = new HashMap<>();
		
		boolean isUsable2 = ms.selectOneComp(cmemberId)==null?true:false;
		
		cmap.put("isUsable2", isUsable2);
		
		return cmap;
		
	}
	
	@GetMapping("/{cmemberId}/checksId.do") 
	@ResponseBody
	public Map<String,Object> checkid4(@PathVariable("cmemberId")String cmemberId,Model model){
		Map<String,Object> smap = new HashMap<>();
		
		boolean isUsable3 = ms.selectOneSomp(cmemberId)==null?true:false;
		
		smap.put("isUsable3", isUsable3);
		
		return smap;
	}

}
