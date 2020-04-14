package kh.mclass.Igre.mypage.model.vo;

import java.io.Serializable;
import java.sql.Timestamp;

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
public class Period implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	private String memberId;
	private String mensesNo;
	private String mensesStart;
	private String mensesEnd;
	private String mensesCycle;
	private String mensesNext;
	private String childbearingAgeStart;
	private String childbearingAgeEnd;
	private String pregnancyDate;
}
