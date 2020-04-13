package kh.mclass.IgreMall.coupon.model.vo;

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
public class CouponInfo implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String couponId;
	private String couponType; //쿠폰 종류(행사쿠폰"E", 신규회원할인"N")';
	private String couponName;
	private String couponDetail;
	private int discountValue;
	private String discountType; //할인 타입 (C: 할인금, P: 할인율)
	private int maxValue;
	private Date couponDuration;
	private Date couponEnrollDate;
	
}
