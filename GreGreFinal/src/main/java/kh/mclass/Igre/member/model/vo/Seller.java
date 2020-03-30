package kh.mclass.Igre.member.model.vo;

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
public class Seller implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String sellerId;
	private String sellerPwd;
	private String compName;
	private String compId;
	private String compNum;
	private String compFax;
	private String compAddress;
	private String sellerName;
	private String sellerPhone;
	private String sellerEmail;
	private String accountNo;
	private String bankName;
	private String accountHolder;
	private String brandName;
	private String salesCategories;
	private String salesAboutprod;
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
