package kh.mclass.IgreMall.wish.model.vo;

import java.io.Serializable;
import java.sql.Date;

import kh.mclass.IgreMall.product.model.vo.Product;
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
	private String wishCheck; 
	private Date wishDate; 
	
	private Product product;


}
