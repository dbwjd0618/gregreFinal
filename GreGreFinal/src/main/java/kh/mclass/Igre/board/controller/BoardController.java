package kh.mclass.Igre.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.mclass.Igre.board.model.service.BoardService;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.Recommendation;
import kh.mclass.Igre.board.model.vo.Reply;
import kh.mclass.Igre.board.model.vo.Report;
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

	@GetMapping("/postList")
	public String postList(@RequestParam("boardCode") String boardCode,
						   @RequestParam(value="cPage", defaultValue="1") int cPage,
						   Model model) {
		String boardName = bs.boardName(boardCode);
		if(boardName == null) {
			boardCode = "B1";
			boardName = "공지사항";
		}
		model.addAttribute("boardName", boardName);
		model.addAttribute("boardCode", boardCode);
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
		
		int postCount = bs.postCount(boardCode);
		model.addAttribute("postCount", postCount);
		
		final int NPP = 10;
		List<Post> postList = bs.postList(boardCode, cPage, NPP);
		model.addAttribute("postList", postList);
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
						   Model model,
						   RedirectAttributes rda) {
		
		Post post = bs.postView(boardCode, postNo);
		if(post == null) {
			rda.addAttribute("msg", "게시글이 존재하지 않습니다.");
			return "redirect:/board/postList?boardCode="+boardCode;
		}
		model.addAttribute("post", post);
				
		int rpCount = bs.replyCount(boardCode, postNo);
		model.addAttribute("replyCount", rpCount);
		
		int endPage = ((rpCount-1)/10)+1;
		if(cPage>endPage)
			cPage = endPage;
		if(cPage<1)
			cPage = 1;
		
		List<Reply> rpList = bs.replyList(boardCode, postNo, cPage);
		model.addAttribute("replyList", rpList);
		
		int prefCount = bs.preferCount(boardCode, postNo);
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
			session.setAttribute("msg", "잘못된 접근입니다.");
			return "redirect:/board/postList?boardCode="+post.getBoardCode();
		}
		int result = bs.deletePost(post);
		session.setAttribute("msg", result>0?"삭제가 완료되었습니다.":"삭제 도중 오류가 발생했습니다.");
		return "redirect:/board/postList?boardCode="+post.getBoardCode();
	}
	
	@PostMapping("/deleteReply.do")
	public String deleteReply(Reply reply, HttpSession session) {
		String writer = bs.confirmWriter(reply);
		if(!writer.equals(reply.getReplyWriter())) {
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
		
		String boardName = bs.boardName(boardCode);
		if(boardName == null) {
			boardCode = "B1";
			boardName = "공지사항";
		}
		model.addAttribute("boardName", boardName);
		model.addAttribute("boardCode", boardCode);
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
		
	}
}
