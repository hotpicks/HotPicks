package com.kitri.hotpicks.admin.model;

public class CommonContentsDto {
	private int countAllContents;
	private int countEndContents;
	private int countNotEndContents;
	private int countOverDateContents;
	private String getCurrentUpdate;

	public int getCountEndContents() {
		return countEndContents;
	}
	public void setCountEndContents(int countEndContents) {
		this.countEndContents = countEndContents;
	}
	public int getCountAllContents() {
		return countAllContents;
	}
	public void setCountAllContents(int countAllContents) {
		this.countAllContents = countAllContents;
	}
	public int getCountNotEndContents() {
		return countNotEndContents;
	}
	public void setCountNotEndContents(int countNotEndContents) {
		this.countNotEndContents = countNotEndContents;
	}
	public int getCountOverDateContents() {
		return countOverDateContents;
	}
	public void setCountOverDateContents(int countOverDateContents) {
		this.countOverDateContents = countOverDateContents;
	}
	public String getGetCurrentUpdate() {
		return getCurrentUpdate;
	}
	public void setGetCurrentUpdate(String getCurrentUpdate) {
		this.getCurrentUpdate = getCurrentUpdate;
	}
	
	
}
