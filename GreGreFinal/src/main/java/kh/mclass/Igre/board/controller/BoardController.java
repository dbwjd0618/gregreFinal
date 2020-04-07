package kh.mclass.Igre.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.board.model.service.BoardService;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.board.model.vo.Report;
import kh.mclass.Igre.common.util.Utils;
import kh.mclass.Igre.member.model.vo.Member;
import kh.mclass.Igre.member.model.vo.PreferList;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board")
@Slf4j
@SessionAttributes(value= {"memberLoggedIn"})
public class BoardController {
	
	@Autowired
	private BoardService bs;
	
	@Autowired
	ServletContext sc;
	
	@Autowired
	ResourceLoader rl;
	
	private Map<String, Object> param = new HashMap<>();

	@GetMapping("/postList")
	public String postList(@RequestParam("boardCode") String boardCode,
						   @RequestParam(value="cPage", defaultValue="1") int cPage,
						   @RequestParam(value="srchOpt", required=false) String srchOpt,
						   @RequestParam(value="srchCon", required=false) String srchCon,
						   @RequestParam(value="srchFilter", required = false) String srchFilter,
						   Model model) {
		param.put("boardCode", boardCode);
		param.put("cPage", cPage);
		if(srchCon != null && !srchCon.equals("")) {
			param.put("srchOpt", srchOpt);
			param.put("srchCon", srchCon);
		}
		if(srchFilter != null && !srchFilter.equals("")) {
			param.put("srchFilter", srchFilter);
		}
		String boardName = bs.boardName(param);
		if(boardName == null) {
			boardCode = "B1";
			boardName = "공지사항";
		}
		model.addAttribute("boardName", boardName);
		model.addAttribute("boardCode", boardCode);
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
		
		int postCount = bs.postCount(param);
		model.addAttribute("postCount", postCount);
		
		int endPage = ((postCount-1)/10)+1;
		if(cPage>endPage) {
			cPage = endPage;
			param.put("cPage", cPage);
		}
		if(cPage<1) {
			cPage = 1;
			param.put("cPage", cPage);
		}
		
		List<Post> postList = bs.postList(param);
		model.addAttribute("postList", postList);
		model.addAttribute("cPage", cPage);
		model.addAttribute("endPage", endPage);
		return "board/postList";
	}
	
	@PostMapping("/preferIn.ajax")
	@ResponseBody
	public void preferIn(PreferList pf, HttpSession session) {
		log.debug(""+pf);
		Member m = (Member)session.getAttribute("memberLoggedIn");
		log.debug(""+m);
		int result = bs.preferIn(pf);
		if(result>0) {
			if(m.getPrefList().containsKey(pf.getBoardCode())) {
				m.getPrefList().get(pf.getBoardCode()).add(pf.getPostNo());
			} else {
				ArrayList<Integer> list = new ArrayList<>();
				list.add(pf.getPostNo());
				m.getPrefList().put(pf.getBoardCode(), list);
			}
			log.debug("더하기 이후"+m);
			session.setAttribute("memberLoggedIn", m);
		}
	}
	
	@PostMapping("/preferOut.ajax")
	@ResponseBody
	public void preferOut(PreferList pf, HttpSession session) {
		log.debug(""+pf);
		Member m = (Member)session.getAttribute("memberLoggedIn");
		log.debug(""+m);
		int result = bs.preferOut(pf);
		if(result>0) {
			m.getPrefList().get(pf.getBoardCode()).remove((Integer)pf.getPostNo());
			log.debug("빼기 이후"+m);
			session.setAttribute("memberLoggedIn", m);
		}
	}
	
	@GetMapping("/postView")
	public String postView(@RequestParam("boardCode") String boardCode,
						   @RequestParam("postNo") int postNo,
						   @RequestParam(value="cPage", defaultValue = "1") int cPage,
						   Model model, HttpServletRequest request, HttpServletResponse response,
						   RedirectAttributes rda) {
		
		param.put("boardCode", boardCode);
		param.put("postNo", postNo);
		param.put("cPage", cPage);
		
		Post post = bs.postView(param);
		if(post == null) {
			rda.addAttribute("msg", "게시글이 존재하지 않습니다.");
			return "redirect:/board/postList?boardCode="+boardCode;
		}
		
//		게시글 조회수 증가
		Cookie[] c = request.getCookies();
		String readValue = "";
		boolean read = false;
		
		if(c != null) {
			for(Cookie pc : c) {
				String name = pc.getName();
				String value = pc.getValue();
				
				if("viewCookie".equals(name)) {
					readValue = value;
					if(value.contains("|"+boardCode+"_"+postNo+"|")) {
						read = true;
						break;
					}
				}
			}
		}
		
		if(!read) {
			readValue += "|"+boardCode+"_"+postNo+"|";
			Cookie postCookie = new Cookie("viewCookie", readValue);
			postCookie.setMaxAge(31*24*60*60);
			postCookie.setPath(request.getContextPath()+"/board");
			response.addCookie(postCookie);
			
			int result = bs.postViewCount(param);
			if(result>0) {
				post = bs.postView(param);
			}
		}
		
		model.addAttribute("post", post);
				
		int rpCount = bs.replyCount(param);
		model.addAttribute("replyCount", rpCount);
		
		int endPage = ((rpCount-1)/10)+1;
		if(cPage>endPage) {
			cPage = endPage;
			param.put("cPage", cPage);
		}
		if(cPage<1) {
			cPage = 1;
			param.put("cPage", cPage);
		}
		
		List<Reply> rpList = bs.replyList(param);
		model.addAttribute("replyList", rpList);
		
		int prefCount = bs.preferCount(param);
		model.addAttribute("prefCount", prefCount);
		model.addAttribute("cPage", cPage);
		model.addAttribute("endPage", endPage);
		
		return "board/postView";
	}
	
	@PostMapping("/replyWrite.ajax")
	@ResponseBody
	public int replyWrite(Reply reply) {
		return bs.replyWrite(reply);
	}
	
	@PostMapping("/recom.ajax")
	@ResponseBody
	public int recomm(Recommendation recom) {
		int check = bs.checkComm(recom);
		if(check > 0) {
			return 0;
		}
		
		if(recom.getReplyNo() == 0) 
			return bs.recommenP(recom);
		else 
			return bs.recommenR(recom);
	}
	
	@PostMapping("/decom.ajax")
	@ResponseBody
	public int decomm(Recommendation recom) {
		int check = bs.checkComm(recom);
		if(check > 0) {
			return 0;
		}
		
		if(recom.getReplyNo() == 0) 
			return bs.decommenP(recom);
		else 
			return bs.decommenR(recom);
	}
	
	@PostMapping("/deletePost.do")
	public String deletePost(Post post, HttpSession session) {
		String writer = bs.confirmWriter(post);
		if(!writer.equals(post.getWriter())) {
			log.debug("Writer = "+writer+" // postWriter = " + post.getWriter());
			session.setAttribute("msg", "잘못된 접근입니다.");
			return "redirect:/board/postList?boardCode="+post.getBoardCode();
		}
		int result = bs.deletePost(post);
		session.setAttribute("msg", result>0?"삭제가 완료되었습니다.":"삭제 도중 오류가 발생했습니다.");
		return "redirect:/board/postList?boardCode="+post.getBoardCode();
	}
	
	@PostMapping("/deleteReply.do")
	public String deleteReply(Reply reply, HttpSession session,
							@RequestParam("writer") String replyWriter) {
		String writer = bs.confirmWriter(reply);
		if(!writer.equals(replyWriter)) {
			log.debug("Writer = "+writer+" // replyWriter = " + replyWriter);
			log.debug(""+reply);
			session.setAttribute("msg", "잘못된 접근입니다.");
		} else {
			int result = bs.deleteReply(reply);
			session.setAttribute("msg", result>0?"삭제가 완료되었습니다.":"삭제 도중 오류가 발생했습니다.");
		}
		return "redirect:/board/postView?boardCode="+reply.getBoardCode()+"&postNo="+reply.getPostNo(); 
	}
	
	@PostMapping("/checkReport.ajax")
	@ResponseBody
	public int checkReport(Report report) {
		return bs.checkReport(report);
	}
	
	@PostMapping("/submitReport.ajax")
	@ResponseBody
	public int submitReport(Report report) {
		return bs.submitReport(report);
	}
	
	@GetMapping("/postWrite.do")
	public void postWrite(Model model, @RequestParam("boardCode") String boardCode) {
		
		param.put("boardCode", boardCode);
		String boardName = bs.boardName(param);
		if(boardName == null) {
			boardCode = "B1";
			boardName = "공지사항";
		}
		model.addAttribute("boardName", boardName);
		model.addAttribute("boardCode", boardCode);
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
	}
	
	@PostMapping("/postWrite.do")
	public String postWriteEnd(Post post, RedirectAttributes rda, HttpServletRequest request,
							   @RequestParam(value="upFile", required=false) MultipartFile upfile) {
		
		if(!(upfile.isEmpty())) {

			String originFileName = upfile.getOriginalFilename();
			String renamedFileName = Utils.getRenamedFileName(originFileName);
			
			//파일 이동
			String saveDirectory = request.getServletContext().getRealPath("/resources/upload/board");
			
			try {
				upfile.transferTo(new File(saveDirectory, renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			post.setOriginFilename(originFileName);
			post.setRenameFilename(renamedFileName);
			
		} else {
			post.setOriginFilename(null);
			post.setRenameFilename(null);
		}
		int result = bs.postWrite(post);
		
		rda.addFlashAttribute("msg", result>0?"게시글이 등록되었습니다.":"게시글 등록 중 오류가 발생했습니다.");
		
		return "redirect:/board/postList?boardCode="+post.getBoardCode();
	}
	
	@GetMapping("/fileDownload.do")
	@ResponseBody
	public Resource fileDownload(@RequestParam("oName") String oName, @RequestParam("rName") String rName, HttpServletResponse response) {
		
		String saveDirectory = sc.getRealPath("/resources/upload/board");
		File downFile = new File(saveDirectory, rName);
		Resource resource = rl.getResource("file:"+downFile);
		
		String downFileName = null;
		try {
			downFileName = new String(oName.getBytes("utf-8"), "ISO-8859-1");
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setContentType("application/octet-stream; charset=utf-8");
		response.addHeader("Content-Disposition", "attachment; filename=\""+downFileName+"\"");
		
		return resource;
	}
	
	@PostMapping("/rplModify.ajax")
	@ResponseBody
	public void replyModify(Reply reply) {
		bs.replyModify(reply);
	}
	
	@PostMapping("/modifyPost.do")
	public String modifyPost(Post post, Model model) {
		Post postM = bs.postView(post);
		model.addAttribute("post", postM);
		return "board/postModify";
	}
	
	@PostMapping("/postModify.do")
	public String modifyPostEnd(Post post, RedirectAttributes rda, HttpServletRequest request,
								@RequestParam(value="upFile", required=false) MultipartFile upfile) {
		log.debug(""+post);
		if(post.getOriginFilename() != null) {
			if(post.getOriginFilename().equals("delete")) {
				post.setOriginFilename(null);
				post.setRenameFilename(null);
			}
			else if(post.getOriginFilename().equals("change")) {
				if(!(upfile.isEmpty())) {

					String originFileName = upfile.getOriginalFilename();
					String renamedFileName = Utils.getRenamedFileName(originFileName);
					
					//파일 이동
					String saveDirectory = request.getServletContext().getRealPath("/resources/upload/board");
					
					try {
						upfile.transferTo(new File(saveDirectory, renamedFileName));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					post.setOriginFilename(originFileName);
					post.setRenameFilename(renamedFileName);
					
				} else {
					post.setOriginFilename(null);
					post.setRenameFilename(null);
				}
			}
		}
		int result = bs.modifyPost(post);
		rda.addFlashAttribute("msg", result>0?"수정이 완료되었습니다.":"수정 중 오류가 발생했습니다.");
		return "redirect:/board/postView?boardCode="+post.getBoardCode()+"&postNo="+post.getPostNo();
	}
}
