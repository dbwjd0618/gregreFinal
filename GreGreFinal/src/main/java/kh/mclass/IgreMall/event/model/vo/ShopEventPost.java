package kh.mclass.IgreMall.event.model.vo;

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
public class ShopEventPost implements Serializable{

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
	private String readCount;
	private String likeCount;
	private String recommenCount;
	private String decommenCount;
	private String originFilename;
	private String renameFilename;

}
