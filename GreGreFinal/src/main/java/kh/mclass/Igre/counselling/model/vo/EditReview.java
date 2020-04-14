package kh.mclass.Igre.counselling.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EditReview implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int advisReviewNo;
	private String reviewerId;
	private String reviewContent;
	private String advisId;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}
