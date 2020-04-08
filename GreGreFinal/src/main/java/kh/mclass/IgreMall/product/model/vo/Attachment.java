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
public class Attachment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int attachmentNo;
	private String productId;
	private String originalImg;
	private String renamedImg;
	private String ImgType;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
