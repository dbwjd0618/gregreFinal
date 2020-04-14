package kh.mclass.IgreMall.admin.event.vo;

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
public class AttachmentEvent implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int attachmentNo;
	private int eventNo;
	private String originalImg;
	private String renamedImg;
	private String ImgType;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
