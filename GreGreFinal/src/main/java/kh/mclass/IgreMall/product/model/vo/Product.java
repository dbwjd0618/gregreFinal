package kh.mclass.IgreMall.product.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

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
public class Product  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String sellerId;
	private String productId;
	private String categoryId;
	private String productName;
	private String brandName;
	private int price;
	private String deliveryFee;
	private int pointRate;
	private int discountPrice;
	private int productStock;
	private String productDetail;
	private Date enrollDate;
	private String productState;

	private List<Attachment> attachList;
	
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Product(String sellerId, String productId, String categoryId, String productName, String brandName,
			int price, String deliveryFee, int pointRate, int discountPrice, int productStock, String productDetail,
			Date enrollDate, String productState) {
		super();
		this.sellerId = sellerId;
		this.productId = productId;
		this.categoryId = categoryId;
		this.productName = productName;
		this.brandName = brandName;
		this.price = price;
		this.deliveryFee = deliveryFee;
		this.pointRate = pointRate;
		this.discountPrice = discountPrice;
		this.productStock = productStock;
		this.productDetail = productDetail;
		this.enrollDate = enrollDate;
		this.productState = productState;
	}
	
	public Product(String categoryId) {
		super();
		this.categoryId = categoryId;
	}
}
