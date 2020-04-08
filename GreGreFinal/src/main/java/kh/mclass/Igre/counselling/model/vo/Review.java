package kh.mclass.Igre.counselling.model.vo;

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
public class Review implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int advisReviewNo;
	private int appointNo;
	private String advisId;
	private String reviewerId;
	private int starPoint;
	private String reviewContent;
	private Date reviewDate;
	private String advisKeyword;
	
	
	

}
