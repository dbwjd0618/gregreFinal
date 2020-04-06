package kh.mclass.Igre.mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;

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

public class Vaccination implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String parentsId;
	private String childId;
	private String vaccinCode;
	private Date vaccinDate;
	private int nth;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
