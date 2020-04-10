package kh.mclass.Igre.inquire.model.vo;

import java.io.Serializable;
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
@ToString(callSuper = true)
public class InqChatMember implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	private InqChatRoom chatRoom;
	private String memberId;
	private long lastCheck;
	private Date regDate;
	private Date expDate;
	private boolean enabled;
	
	public InqChatMember(String memberId, InqChatRoom chatRoom) {
		this.setMemberId(memberId);
		this.chatRoom = chatRoom;
	}

}
