package kh.mclass.Igre.counselling.model.vo;

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
public class Counselor implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String advisId;
	private String advisName;
	private String advisIntro;
	private String advisLineIntro;
	private String advisCareer;
	private String advisLicense;
	private String advisGrade;
	private String advisGender;
	private String advisDay;
	private String advisPrice;
	private String advisKeyword;
	private String advisLicenseFile;
	private String advisImg;
	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
