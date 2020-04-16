package kh.mclass.IgreMall.event.model.vo;

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
public class ShopEventRecommendation implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String boardCode;
	private int postNo;
	private int replyNo;

}
