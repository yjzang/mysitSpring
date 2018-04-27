package com.javaex.vo;

public class PagerVO {

	int page;
	int page_set;
	int begin;
	int end;
	int count;
	String kwd;
	
	public String getKwd() {
		return kwd;
	}
	public void setKwd(String kwd) {
		this.kwd = kwd;
	}
	
	public int getPage_set() {
		return page_set;
	}
	public void setPage_set(int page_set) {
		this.page_set = page_set;
	}
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

	
	
	
	
}
