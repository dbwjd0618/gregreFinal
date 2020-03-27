package kh.mclass.Igre.counselling.model.vo;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CounselorWithFileCount extends Counselor implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int fileCount;

	public CounselorWithFileCount(String advisName, String advisLineIntro, String advisGrade, String advisPrice, String[] advisKeyword, String advisImg) {
		super(advisName, advisLineIntro, advisGrade, advisPrice, advisKeyword, advisImg);
		this.fileCount = fileCount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
	
}
