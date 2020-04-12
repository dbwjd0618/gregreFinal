package kh.mclass.Igre.member.model.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kh.mclass.Igre.counselling.model.vo.Counselor;
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
public class BizMember extends Counselor implements Serializable{

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	private static final long serialVersionUID = 1L;
	
	private String cmemberId;
	private String memberPwd;
	private String phone;
	private String compDiv;

	


	private HashMap<String, ArrayList<Integer>> prefList2;
	

	
	
}
