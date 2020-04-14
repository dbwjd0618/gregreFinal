package kh.mclass.IgreMall.QnA.model.vo;

import java.io.Serializable;
import java.sql.Date;

import kh.mclass.IgreMall.admin.question.model.vo.AdminQnA;
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
public class ProdQnA  implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String qaId;
	private String productId;
	private String qtnerId;
	private String qtnTitle;
	private String qtnContent;
	private Date qtnDate;
	private String setSecret;
	private String qaState;
	
	private AdminAnswer adminAnswer;
}
