package com.kitri.hotpicks.contents.model;

public class ContentsTypeDto {

	private int catId;
	private String catName;
	private String catType;
	private String catCode;
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCatType() {
		return catType;
	}
	public void setCatType(String catType) {
		this.catType = catType;
	}
	public String getCatCode() {
		return catCode;
	}
	public void setCatCode(String catCode) {
		this.catCode = catCode;
	}
	@Override
	public String toString() {
		return "ContentsTypeDto [catId=" + catId + ", catName=" + catName + ", catType=" + catType + ", catCode="
				+ catCode + "]";
	}
	

	
}
