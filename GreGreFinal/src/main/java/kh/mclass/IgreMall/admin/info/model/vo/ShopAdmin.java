package kh.mclass.IgreMall.admin.info.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ShopAdmin implements Serializable{
	
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
	private String bankName;
	private String accountNo;
	private String accountHolder;
	private String brandName;
	
	
}
