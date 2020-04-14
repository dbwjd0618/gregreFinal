package kh.mclass.IgreMall.review.model.vo;

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
public class ReviewReco implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String reviewId;
	private String recoCheck;
}
