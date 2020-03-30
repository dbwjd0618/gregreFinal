package kh.mclass.Igre.admin.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * 신고처리시 필요한 객체 선언
 *
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Report implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int reportNo; //신고번호
	private String reporterId; //신고자ID
	private String boardName; //게시판 명
	private String boardCode; //게시판 코드
	private int reportPostNo; //신고된 게시글 번호
	private int reportReplyNo; //신고된 댓글 번호
	private String reporteeId; //피신고자 ID
	private String reportContent; //신고내용
	private String reportConf; //처리여부
	private String title; //게시글제목
	private String content; //게시글내용
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
