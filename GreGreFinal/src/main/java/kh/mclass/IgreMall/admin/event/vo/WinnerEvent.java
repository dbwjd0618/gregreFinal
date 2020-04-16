package kh.mclass.IgreMall.admin.event.vo;

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

public class WinnerEvent {
	private int eventNo;
	private String eventPratNo;
	private String memberId;
	private String resultMsg;
	private String couponId;
}
