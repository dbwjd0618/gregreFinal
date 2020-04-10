package kh.mclass.IgreMall.review.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import kh.mclass.IgreMall.product.model.vo.ProdOption;
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
public class ProdReview implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String reviewId;
	private String orderNo;
	private String productId;
	private String productName;
	private String brandName;
	private String[] optionId;
	private String[] optionName;
	private String reviewerId;
	private int starPoint;
	private Date reviewDate;
	private String reviewContent;
	private String originalImg;
	private String renamedImg;
	private int reviewRecommen;
	private String prodImg;
	
}
