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
	
	private List<OrderProduct> orderProdList;
	private PaymentInfo paymentInfo;
	
	private String productName;
	
	private List<Attachment2> attachList;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public OrderList(String orderNo, String memberId, String sellerId, String productId, String payMethod,
			int totalPrice, int totalDeliveryFee, String recptName, String recptPhone, String recptEmail,
			String recptZipcode, String recptAddr, String recptDetailAddr, String deliveryText, String deliveryNo,
			String payState, String deliveryState, Date orderDate) {
		super();
		this.orderNo = orderNo;
		this.memberId = memberId;
		this.sellerId = sellerId;
		this.productId = productId;
		this.payMethod = payMethod;
		this.totalPrice = totalPrice;
		this.totalDeliveryFee = totalDeliveryFee;
		this.recptName = recptName;
		this.recptPhone = recptPhone;
		this.recptEmail = recptEmail;
		this.recptZipcode = recptZipcode;
		this.recptAddr = recptAddr;
		this.recptDetailAddr = recptDetailAddr;
		this.deliveryText = deliveryText;
		this.deliveryNo = deliveryNo;
		this.payState = payState;
		this.deliveryState = deliveryState;
		this.orderDate = orderDate;
	}
	
	

}
