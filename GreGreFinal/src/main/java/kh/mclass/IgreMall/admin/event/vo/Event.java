package kh.mclass.IgreMall.admin.event.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Event {
	private int eventNo;
	private String eventTitle;
	private Date eventStart;
	private Date eventEnd;
	private String eventType;
	private String eventContent;
	private String thumOrgImg;
	private String thumReImg;
	
	
}
