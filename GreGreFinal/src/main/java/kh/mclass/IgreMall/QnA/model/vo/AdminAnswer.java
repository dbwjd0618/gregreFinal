package kh.mclass.IgreMall.QnA.model.vo;

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
public class AdminAnswer implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String answerId;
	private String qaId;
	private String sellerId;
	private String ansContent;
	private Date ansDate;
}
