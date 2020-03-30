package kh.mclass.IgreMall.product.model.vo;

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
public class ProdOption implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String optionId;
	private String productId;
	private String optionName;
	private String optionValue;
	private int optionStock;
	private int optionPrice;
	private String optionState;

	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	
	
}
