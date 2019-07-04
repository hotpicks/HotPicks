package com.kitri.hotpicks.contents.model;

public class ContentsTypeDto {

	private int catId;
	private String cateName;
	private String cateType;
	private String cateCode;
	
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateType() {
		return cateType;
	}
	public void setCateType(String cateType) {
		this.cateType = cateType;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	@Override
	public String toString() {
		return "ContentsTypeDto [catId=" + catId + ", cateName=" + cateName + ", cateType=" + cateType + ", cateCode="
				+ cateCode + "]";
	}

	
	
}
