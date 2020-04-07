package kh.mclass.IgreMall.order.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

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
public class OrderList implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNo;
	private String memberId;
	private String sellerId;
	private String productId;
	private String payMethod;
	private int totalPrice;
	private int totalDeliveryFee;
	private String recptName;
	private String recptPhone;
	private String recptEmail;
	private String recptZipcode;
	private String recptAddr;
	private String recptDetailAddr;
	private String deliveryText;
	private String deliveryNo;
	private String payState;
	private String deliveryState;
	private Date orderDate;
	
	private String productName;
	
	private List<Attachment2> attachList;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
