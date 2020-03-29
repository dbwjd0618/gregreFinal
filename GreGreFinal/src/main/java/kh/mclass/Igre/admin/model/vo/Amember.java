package kh.mclass.Igre.admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *	Admin에서 사용할 member객체를 기재한 vo => AdminMember의 약자 
 */

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Amember implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private Date birthday;
	private String phone;
	private String address;
	private String email;
	private String grade;
	private String gender;
	private int age;
	private Date enrollDate;

}
