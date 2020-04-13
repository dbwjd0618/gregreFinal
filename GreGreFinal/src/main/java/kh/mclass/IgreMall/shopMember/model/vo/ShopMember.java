package kh.mclass.IgreMall.shopMember.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import kh.mclass.IgreMall.coupon.model.vo.Coupon;
import kh.mclass.IgreMall.wish.model.vo.Wish;
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
public class ShopMember implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private Date birthday;
	private String phone;
	private String address;
	private String email;
	private Date enrollDate;
	private int point;
	
	private List<Coupon> couponList;
	private List<Cart> cartList;
	private List<Wish> wishList;

	public ShopMember(String memberId, String memberPwd, String memberName, String nickname, Date birthday,
			String phone, String address, String email, int point) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickname = nickname;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.point = point;
	}
	
	
}
