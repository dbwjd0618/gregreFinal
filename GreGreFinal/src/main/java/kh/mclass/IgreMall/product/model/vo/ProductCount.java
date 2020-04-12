package kh.mclass.IgreMall.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
			int price, int supplyValue, String deliveryFee, int pointRate, int discountPrice, int productStock,
			String productDetail, Date enrollDate, String productState, String[] paymentMethodCode, int productCount) {
		super(sellerId, productId, categoryId, productName, brandName, price, supplyValue, deliveryFee, pointRate,
				discountPrice, productStock, productDetail, enrollDate, productState, paymentMethodCode);
		this.productCount= productCount;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
