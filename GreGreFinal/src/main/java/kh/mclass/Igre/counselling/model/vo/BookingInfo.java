package kh.mclass.Igre.counselling.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

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
public class BookingInfo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String appointNo;
	private String advisId;
	private String coin;
	private Date startDay;
	private Date endDay;
	private String payPrice;
	private String payInfo;
	private String advisName;
	private String advisImg; 
	private String[] advisKeyword;
	private String advisKeyStr;
	private ArrayList<String> advisKeyList;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}	
	
}

