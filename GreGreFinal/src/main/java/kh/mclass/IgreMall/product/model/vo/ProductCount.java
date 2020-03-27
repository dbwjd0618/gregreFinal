package kh.mclass.IgreMall.product.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ProductCount extends Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int productCount;

	public ProductCount(String sellerId, String productId, String categoryId, String productName, String brandName,
			int price, String deliveryFee, int pointRate, int discountPrice, int productStock, String productDetail,
			Date enrollDate, String productState,int productCount) {
		super(sellerId, productId, categoryId, productName, brandName, price, deliveryFee, pointRate, discountPrice,
				productStock, productDetail, enrollDate, productState);
		this.productCount= productCount;
	}
}
