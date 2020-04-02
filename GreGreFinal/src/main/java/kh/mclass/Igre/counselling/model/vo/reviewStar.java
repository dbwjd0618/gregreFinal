package kh.mclass.Igre.counselling.model.vo;

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
public class reviewStar implements Serializable{

	
	private static final long serialVersionUID = 1L;
	
	private int starPoint;
	private int reviewCount;
	

}
