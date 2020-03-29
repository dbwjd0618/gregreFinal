package kh.mclass.Igre.member.model.vo;

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
public class PreferList implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String boardCode;
	private int postNo;

}
