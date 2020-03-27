package kh.mclass.Igre.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *	Admin 객체 vo
 *	TB_MEMBER_INFO에서 Admin에 필요한 정보만 기재
 */


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Admin implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String adminId;
	private String adminPwd;
	private String adminName;
	private String grade;
	private String nickname;
	private Date birthday;
	private String phone;
	private String address;
	private String email;
	private String gender;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
