package kh.mclass.IgreMall.admin.account.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class PayMethod implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String payMethod;
	private int count;
	
	private int naCount;
	private int naPrice;
	private int KaCount;
	private int kaPrice;
	private int toCount;
	private int toPrice;
	private int acCount;
	private int acPrice;
	private int crCount;
	private int crPrice;
	private int raCount;
	private int raPrice;
	private	int phCount;
	private	int phPrice;
	private String productId;
	
	private int totalCount;
	private int totalPrice;
	private int supplyValue;

}
