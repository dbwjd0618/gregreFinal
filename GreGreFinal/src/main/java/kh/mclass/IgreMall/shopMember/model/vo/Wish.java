package kh.mclass.IgreMall.shopMember.model.vo;

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
public class Wish implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String wishId; 
	private String memberId; 
	private String productId; 
	private String optionId; 
	private Date wishDate; 


}
