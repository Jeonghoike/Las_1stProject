package com.lec.las.dto;

import java.sql.Timestamp;

public class FileBoardDto {
	private int fid;
	private String mid;
	private String mname;
	private String ftitle;
	private String fcontent;
	private String ffileName;
	private String fpw;
	private int fhit;
	private int fgroup;
	private int fstep;
	private int findent;
	private String fip;
	private Timestamp frdate;
	public FileBoardDto() { }
	public FileBoardDto(int fid, String mid, String mname, String ftitle, String fcontent, String ffileName, String fpw,
			int fhit, int fgroup, int fstep, int findent, String fip, Timestamp frdate) {
		this.fid = fid;
		this.mid = mid;
		this.mname = mname;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.ffileName = ffileName;
		this.fpw = fpw;
		this.fhit = fhit;
		this.fgroup = fgroup;
		this.fstep = fstep;
		this.findent = findent;
		this.fip = fip;
		this.frdate = frdate;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public String getFfileName() {
		return ffileName;
	}
	public void setFfileName(String ffileName) {
		this.ffileName = ffileName;
	}
	public String getFpw() {
		return fpw;
	}
	public void setFpw(String fpw) {
		this.fpw = fpw;
	}
	public int getFhit() {
		return fhit;
	}
	public void setFhit(int fhit) {
		this.fhit = fhit;
	}
	public int getFgroup() {
		return fgroup;
	}
	public void setFgroup(int fgroup) {
		this.fgroup = fgroup;
	}
	public int getFstep() {
		return fstep;
	}
	public void setFstep(int fstep) {
		this.fstep = fstep;
	}
	public int getFindent() {
		return findent;
	}
	public void setFindent(int findent) {
		this.findent = findent;
	}
	public String getFip() {
		return fip;
	}
	public void setFip(String fip) {
		this.fip = fip;
	}
	public Timestamp getFrdate() {
		return frdate;
	}
	public void setFrdate(Timestamp frdate) {
		this.frdate = frdate;
	}
	@Override
	public String toString() {
		return "FileBoardDto [fid=" + fid + ", mid=" + mid + ", mname=" + mname + ", ftitle=" + ftitle + ", fcontent="
				+ fcontent + ", ffileName=" + ffileName + ", fpw=" + fpw + ", fhit=" + fhit + ", fgroup=" + fgroup
				+ ", fstep=" + fstep + ", findent=" + findent + ", fip=" + fip + ", frdate=" + frdate + "]";
	}
}
