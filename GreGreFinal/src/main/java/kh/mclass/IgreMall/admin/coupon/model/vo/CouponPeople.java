package kh.mclass.IgreMall.admin.coupon.model.vo;

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
public class CouponPeople implements Serializable{	
	
	private static final long serialVersionUID = 1L;
	
	private String couponId;
	private String memberId;
	//tb_coupon_list 테이블
	private int expireDate;
	private String couponState;
	
}
