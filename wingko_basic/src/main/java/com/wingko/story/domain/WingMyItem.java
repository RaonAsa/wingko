package com.wingko.story.domain;
/**
 *TODO
 *
 * @author 	hotdog
 * @version 1.0, 	2013. 9. 7.
 */
public class WingMyItem extends PayItem {
	private String pay_method;
	private String pay_type;
	private String pay_state;
	private String pay_date;
	private String cancel_date;
	private String start_date;
	private String end_date;
	private String image_thumb;

	
	@Override
	public String toString() {
		return "WingMyItem [pay_method=" + pay_method + ", pay_type="
				+ pay_type + ", pay_state=" + pay_state + ", pay_date="
				+ pay_date + ", cancel_date=" + cancel_date + ", start_date="
				+ start_date + ", end_date=" + end_date + ", image_thumb="
				+ image_thumb + "]" + super.toString();
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	
	public String getCancel_date() {
		return cancel_date;
	}

	public void setCancel_date(String cancel_date) {
		this.cancel_date = cancel_date;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getImage_thumb() {
		return image_thumb;
	}

	public void setImage_thumb(String image_thumb) {
		this.image_thumb = image_thumb;
	}
	
}
