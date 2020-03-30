package kh.mclass.Igre.member.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class Advis implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private String advisId;
	private String originalFileName;
	private String renamedFileName;
	private String advisName;
	private String advisIntro;
	private String advisCareer;
	private String advisLicense;
	private String grade;
	private String licenseFile;
	private String advisImg;



}
