package com.lec.las.dto;

import java.sql.Timestamp;

public class BookDto {
	private int bid;
	private String btitle;
	private String bauthor;
	private String bimage1;
	private String bimage2;
	private String bcontent;
	private Timestamp brdate;
	public BookDto() { }
	public BookDto(int bid, String btitle, String bauthor, String bimage1, String bimage2, String bcontent,
			Timestamp brdate) {
		this.bid = bid;
		this.btitle = btitle;
		this.bauthor = bauthor;
		this.bimage1 = bimage1;
		this.bimage2 = bimage2;
		this.bcontent = bcontent;
		this.brdate = brdate;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBimage1() {
		return bimage1;
	}
	public void setBimage1(String bimage1) {
		this.bimage1 = bimage1;
	}
	public String getBimage2() {
		return bimage2;
	}
	public void setBimage2(String bimage2) {
		this.bimage2 = bimage2;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public Timestamp getBrdate() {
		return brdate;
	}
	public void setBrdate(Timestamp brdate) {
		this.brdate = brdate;
	}
	@Override
	public String toString() {
		return "BookDto [bid=" + bid + ", btitle=" + btitle + ", bauthor=" + bauthor + ", bimage1=" + bimage1
				+ ", bimage2=" + bimage2 + ", bcontent=" + bcontent + ", brdate=" + brdate + "]";
	}
}
