package kh.mclass.IgreMall.product.model.vo;

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
public class Product  implements Serializable{/**
	 * 
	 * 
	 */
	
	
	private static final long serialVersionUID = 1L;
	
	private String sellerId;
	private String productId;
	private String categoryId;
	private String productName;
	private String brandName;
	private int price;
	private String deliveryFee;
	private int pointRate;
	private int discountPrice;
	private int productStock;
	private String productDetail;
	private Date enrollDate;
	private String productState;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	


}
