package kh.mclass.IgreMall.admin.coupon.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.Setter;


@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ChartValue {
	private int price;
	private int supValue;
	private Date Adate;
}
