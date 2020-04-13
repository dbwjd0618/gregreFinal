package kh.mclass.IgreMall.admin.orderList.model.vo;

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
public class AdminPaymentInfo implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNo;
	private int prodPrice; //할인적용 안된 총 상품 금액
	private int totalDiscount; //할인금액
	private int usedPoint; //사용포인트 금액
	private int usedCoupon; //사용 쿠폰 금액
}
