package kh.mclass.Igre;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.mclass.Igre.board.model.service.BoardService;
import kh.mclass.Igre.board.model.vo.Board;

@Controller
@SessionAttributes(value={"boardList"})
public class HomeController {
	
	@Autowired
	private BoardService bs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<Board> boardList = bs.boardList();
		model.addAttribute("boardList", boardList);
		return "index";
	}
	
}
