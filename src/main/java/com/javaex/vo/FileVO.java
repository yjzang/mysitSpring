package com.javaex.vo;



public class FileVO {

	
	String no;
	String filePath;
	String saveName;
	String orgName;
	long fileSize;
	int begin;
	int end;
	String userNo;
	String userName;
	String like;
	String state;
	
	
	
	
	
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	
	@Override
	public String toString() {
		return "FileVO [no=" + no + ", filePath=" + filePath + ", saveName=" + saveName + ", orgName=" + orgName
				+ ", fileSize=" + fileSize + ", begin=" + begin + ", end=" + end + ", userNo=" + userNo + ", userName="
				+ userName + "]";
	}
	
	


	
	
	
	
	
	
	
}
