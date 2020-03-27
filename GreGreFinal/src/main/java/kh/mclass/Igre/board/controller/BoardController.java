package kh.mclass.Igre.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.mclass.Igre.board.model.service.BoardService;
import kh.mclass.Igre.board.model.vo.Board;
import kh.mclass.Igre.board.model.vo.Post;
import kh.mclass.Igre.board.model.vo.PostList;

@Controller
@RequestMapping("/board")
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
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
		
		int postCount = bs.postCount(boardCode);
		model.addAttribute("postCount", postCount);
		
		final int NPP = 10;
		PostList bc = new PostList(boardCode);
		List<Post> postList = bs.postList(bc, cPage, NPP);
		model.addAttribute("postList", postList);
		return "board/postList";
	}
}
