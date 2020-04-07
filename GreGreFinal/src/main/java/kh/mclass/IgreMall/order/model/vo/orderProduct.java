package kh.mclass.IgreMall.order.model.vo;

import java.io.Serializable;

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
public class orderProduct implements Serializable{/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String orderNo;
	private String productId;
	private String[] optionId;
	private String[] prodId;
}
