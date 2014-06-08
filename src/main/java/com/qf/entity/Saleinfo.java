package com.qf.entity;

import java.io.Serializable;
import java.util.Date;

public class Saleinfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int ts_id;
	private int ts_user_id;

	public int getTs_id() {
		return ts_id;
	}

	public void setTs_id(int ts_id) {
		this.ts_id = ts_id;
	}

	public int getTs_user_id() {
		return ts_user_id;
	}

	public void setTs_user_id(int ts_user_id) {
		this.ts_user_id = ts_user_id;
	}

	public int getTs_sale_money() {
		return ts_sale_money;
	}

	public void setTs_sale_money(int ts_sale_money) {
		this.ts_sale_money = ts_sale_money;
	}

	public int getTs_month() {
		return ts_month;
	}

	public void setTs_month(int ts_month) {
		this.ts_month = ts_month;
	}

	public int getTs_source() {
		return ts_source;
	}

	public void setTs_source(int ts_source) {
		this.ts_source = ts_source;
	}

	public Date getTs_createtime() {
		return ts_createtime;
	}

	public void setTs_createtime(Date ts_createtime) {
		this.ts_createtime = ts_createtime;
	}

	public Date getTs_is_deletetime() {
		return ts_is_deletetime;
	}

	public void setTs_is_deletetime(Date ts_is_deletetime) {
		this.ts_is_deletetime = ts_is_deletetime;
	}

	public int getTs_operation_user_id() {
		return ts_operation_user_id;
	}

	public void setTs_operation_user_id(int ts_operation_user_id) {
		this.ts_operation_user_id = ts_operation_user_id;
	}

	private int ts_sale_money;
	private int ts_month;
	private int ts_source;
	private Date ts_createtime;
	private Date ts_is_deletetime;
	private int ts_operation_user_id;

}
