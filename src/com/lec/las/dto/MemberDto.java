package com.lec.las.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDto {
	private String mid;
	private String mpw;
	private String mname;
	private String mtel;
	private String memail;
	private String mgender;
	private Date mbirth;
	private String maddress;
	private Timestamp mrdate;
	public MemberDto() { }
	public MemberDto(String mid, String mpw, String mname, String mtel, String memail, String mgender, Date mbirth,
			String maddress, Timestamp mrdate) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mtel = mtel;
		this.memail = memail;
		this.mgender = mgender;
		this.mbirth = mbirth;
		this.maddress = maddress;
		this.mrdate = mrdate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public Date getMbirth() {
		return mbirth;
	}
	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public Timestamp getMrdate() {
		return mrdate;
	}
	public void setMrdate(Timestamp mrdate) {
		this.mrdate = mrdate;
	}
	@Override
	public String toString() {
		return "MemberDto [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mtel=" + mtel + ", memail=" + memail
				+ ", mgender=" + mgender + ", mbirth=" + mbirth + ", maddress=" + maddress + ", mrdate=" + mrdate + "]";
	}
}
