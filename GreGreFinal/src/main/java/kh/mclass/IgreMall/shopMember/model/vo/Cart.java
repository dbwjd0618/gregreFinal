package kh.mclass.IgreMall.shopMember.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import kh.mclass.IgreMall.product.model.vo.ProdOption;
import kh.mclass.IgreMall.product.model.vo.Product;
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
public class Cart implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//장바구니정보
	private String cartId;
	private String memberId;
	private String productId;
	private String optionId[];
	private String prodCount[];
	private Date cartDate;
	
	
	// 제품정보
	private Product product;
	// 옵션정보
	private List<ProdOption> optionList;
	
	public Cart(String cartId, String memberId, String productId, String[] optionId, String[] prodCount,
			Date cartDate) {
		super();
		this.cartId = cartId;
		this.memberId = memberId;
		this.productId = productId;
		this.optionId = optionId;
		this.prodCount = prodCount;
		this.cartDate = cartDate;
	}
	
	
	
	
}
