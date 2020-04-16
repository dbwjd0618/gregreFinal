package kh.mclass.IgreMall.product.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

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
public class Product  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String sellerId; 
	private String productId;
	private String categoryId;
	private String productName;
	private String brandName;
	private int price; //판매가액
	private int supplyValue; //공급가액
	private String deliveryFee;
	private int pointRate;
	private int discountPrice;
	private int productStock;
	private String productDetail;
	private Date enrollDate;
	private String productState;//판매상태판매중(Y), 품절(S), 단종(D)
	//신용카드: cr  , 무통장입금 ac,  가상계좌 va, 핸드폰: ph ,실시간 계좌이체 ra, 카카오페이 ka, 토스 to, 네이버페이: na
	private String[] paymentMethodCode; 

	private List<Attachment> attachList;
	private List<ProdOption> optionList;
	private Wish wish;
	
	private String keyword;
	
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
	
	

	public Product(String sellerId, String productId, String categoryId, String productName, String brandName,
			int price, int supplyValue, String deliveryFee, int pointRate, int discountPrice, int productStock,
			String productDetail, Date enrollDate, String productState, String[] paymentMethodCode) {
		super();
		this.sellerId = sellerId;
		this.productId = productId;
		this.categoryId = categoryId;
		this.productName = productName;
		this.brandName = brandName;
		this.price = price;
		this.supplyValue = supplyValue;
		this.deliveryFee = deliveryFee;
		this.pointRate = pointRate;
		this.discountPrice = discountPrice;
		this.productStock = productStock;
		this.productDetail = productDetail;
		this.enrollDate = enrollDate;
		this.productState = productState;
		this.paymentMethodCode = paymentMethodCode;
	}
	public Product(String categoryId) {
		super();
		this.categoryId = categoryId;
	}
	
}
