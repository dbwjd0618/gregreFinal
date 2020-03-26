package kh.mclass.Igre.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
public class Post implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String boardCode;
	private int postNo;
	private String writer;
	private String notice;
	private String postPwd;
	private String title;
	private String content;
	private Date postWriteTime;
	private int readCount;
	private int likeCount;
	private int recommenCount;
	private int decommenCount;
	private String originFilename;
	private String renameFilename;

}
