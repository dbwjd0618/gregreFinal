package kh.mclass.Igre.adminchat.model.vo;

import java.io.Serializable;
import java.sql.Date;

import kh.mclass.Igre.chat.model.vo.ChatRoom;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString(callSuper=true)
public class AdminChatMember implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private AdminChatRoom adminChatRoom;
	private String memberId;
	private long lastCheck;
	private Date regDate;
	private Date expDate;
	private boolean enabled;
	
	public AdminChatMember(String memberId, AdminChatRoom adminChatRoom) {
		this.setMemberId(memberId);
		this.adminChatRoom = adminChatRoom;
	}

}
