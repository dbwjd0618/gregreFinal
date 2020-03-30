package kh.mclass.Igre.member.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


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
public class BizMember implements Serializable{

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String cmemberId;
	private String memberPwd;
	private String phone;
	private String compDiv;


	private List<Advis> advisList;


	private HashMap<String, ArrayList<Integer>> prefList2;
	
	public BizMember(String cmemberId, String memberPwd, String phone, String compDiv) {
		super();
		this.cmemberId = cmemberId;
		this.memberPwd = memberPwd;
		this.phone = phone;
		this.compDiv = compDiv;
	}
	
	
}
