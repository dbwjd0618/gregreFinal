package kh.mclass.IgreMall.order.model.vo;

import java.io.Serializable;

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
public class OrderProduct implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNo;
	private String productId;
	private String productName;
	private String productBrand;
	private String[] optionId;
	private String[] optionName;
	private String[] optionValue;
	private String[] optionPrice;
	private String[] prodCount;
	private String renamedImg;
	private int deliveryFee;
	private String reviewId;
	public OrderProduct(String orderNo, String productId, String[] optionId, String[] prodCount) {
		super();
		this.orderNo = orderNo;
		this.productId = productId;
		this.optionId = optionId;
		this.prodCount = prodCount;
	}

	
}
