package kh.mclass.IgreMall.admin.question.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor

public class AdminQnA {
	private String qaId;
	private String productId;
	private String qtnerId;
	private String qtnTitle;
	private String qtnContent;
	private Date qtnDate;
	private String qaState;
	private String productName;
	private String categoryId;
	
}
