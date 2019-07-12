package com.kitri.hotpicks.contents.model;

public class ContentsDto {

	private int contentsId;
	private String title;
	private int catId;
	private String catCode;
	private int sggCode;
	private int sdCode;
	private String image1;
	private String image2;
	private int hit;
	
	
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCatId() {
		return catId;
	}
	public void setCatId(int catId) {
		this.catId = catId;
	}
	public String getCatCode() {
		return catCode;
	}
	public void setCatCode(String catCode) {
		this.catCode = catCode;
	}
	public int getSggCode() {
		return sggCode;
	}
	public void setSggCode(int sggCode) {
		this.sggCode = sggCode;
	}
	public int getSdCode() {
		return sdCode;
	}
	public void setSdCode(int sdCode) {
		this.sdCode = sdCode;
	}
	public String getImage1() {
		return image1;
	}
	public void setImage1(String image1) {
		this.image1 = image1;
	}
	public String getImage2() {
		return image2;
	}
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
	@Override
	public String toString() {
		return "ContentsDto [contentsId=" + contentsId + ", title=" + title + ", catId=" + catId + ", catCode="
				+ catCode + ", sggCode=" + sggCode + ", sdCode=" + sdCode + ", image1=" + image1 + ", image2=" + image2
				+ ", hit=" + hit + "]";
	}




}
