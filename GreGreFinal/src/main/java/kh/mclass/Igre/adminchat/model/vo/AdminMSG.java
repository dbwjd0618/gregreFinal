package kh.mclass.Igre.adminchat.model.vo;

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
public class AdminMSG {
	private long id;
	private String chatRoomId;
	private String memberId;
	private String msg;
	private long time;
	private AdminMsgType type;

}
