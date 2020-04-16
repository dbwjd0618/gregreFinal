package kh.mclass.Igre.board.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Report implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String reporterId;
	private String reporteeId;
	private String boardCode;
	private int postNo;
	private int replyNo;
	private String reportContent;

}
