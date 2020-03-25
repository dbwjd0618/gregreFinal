package kh.mclass.Igre.admin.model.vo;

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

public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String adminId;
	private String adminPwd;
	private String grade;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
