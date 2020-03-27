package kh.mclass.Igre.member.model.vo;

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
public class Member implements Serializable{

	private static final long serialVersionUID = 1L;

	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickname;
	private Date birthday;
	private String phone;
	private String pwdHintCode;
	private String pwdAns;
	private String address;
	private String email;
	private String gender;
	private String grade;
	private int age;
	private String mateId;
	private int childNumber;
	private Date enrollDate;
}
