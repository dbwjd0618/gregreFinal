package kh.mclass.Igre.chat.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ChatInfo implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String advisId;
	private String advisName;
	private String advisCareer;
	private String advisLicense;
	private String advisGrade;
	private String advisKeyword;
	private String advisImg;
	private String memberId;
	private String coin;
	private Date startDay;
	private Date endDay;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
