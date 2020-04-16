package kh.mclass.IgreMall.event.model.vo;

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
public class Winner {
	private int eventNo;
	private int eventPartNo;
	private String eventPartId;
	private String eventPartContent;
	private int couponId;
	private String couponName;
	private String eventTitle;
	private Date replyWriteTime;
}
