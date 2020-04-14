package kh.mclass.Igre.counselling.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class BookingInfoMypage extends BookingInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String advisName;
	private String advisImg;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

}
