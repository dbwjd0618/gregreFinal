package kh.mclass.Igre.member.model.vo;

import java.io.Serializable;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private String advisName;
	private String advisIntro;
	private String advisCareer;
	private String advisLicense;
	private String advisLineIntro;
	private String advisGender;
	private int advisPrice;
	private String advisGrade;
	private String advisDay;
	private String advislicenseFile;
	private String advisImg;
	private String advisKeyword;



}
