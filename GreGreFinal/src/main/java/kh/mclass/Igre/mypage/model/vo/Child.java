package kh.mclass.Igre.mypage.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

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

public class Child implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String parentsId;
	private String childId;
	private String childName;
	private Date birthday;
	private String gender;
	private String phone;
	private String mensesNo;
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
