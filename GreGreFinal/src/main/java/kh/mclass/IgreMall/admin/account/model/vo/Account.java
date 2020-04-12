package kh.mclass.IgreMall.admin.account.model.vo;

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
public class Account implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int count;
	
	private String orderNo;
	private String memberId;
	private String productId;
	private String productName;
	private int supPrice;
	private int totalPrice;
	private int totalDeliveryFee;
	private String paymentMethod;
	private Date orderDate;
	private String payMethod;
	private String payState;
	private int supplyValue;
}
