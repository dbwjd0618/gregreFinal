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
public class ShopEventReply implements Serializable{

	private static final long serialVersionUID = 1L;

	private String boardCode;
	private int postNo;
	private int replyNo;
	private String replyWriter;
	private String replyContent;
	private Date replyWriteTime;
	private int recommenCount;
	private int decommenCount;
}
