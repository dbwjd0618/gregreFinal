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
public class Coupon implements Serializable{	
	
	private static final long serialVersionUID = 1L;
	
	//tb_coupon_list 테이블
	private String couponId; 
	private Date expireDate;
	private String couponState; //쿠폰 사용여부(사용가능 쿠폰 Y, 사용불가 N)
	
	//tb_coupon_info 테이블ㄴ
	private String couponName;
	private String couponDetail;
	private int discountValue;
	private String discountType; //할인 타입 (C: 할인금, P: 할인율)
	private int maxValue;
	
}
