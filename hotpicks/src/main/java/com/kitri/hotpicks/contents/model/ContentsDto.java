package com.kitri.hotpicks.contents.model;

public class ContentsDto {

	private String contentsId;
	private String title;
	private String catId;
	private String sggCode;
	private String sdCode;
	private String image1;
	private String image2;
	private int hit;
	
	
	public String getContentsId() {
		return contentsId;
	}
	public void setContentsId(String contentsId) {
		this.contentsId = contentsId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	public String getSggCode() {
		return sggCode;
	}
	public void setSggCode(String sggCode) {
		this.sggCode = sggCode;
	}
	public String getSdCode() {
		return sdCode;
	}
	public void setSdCode(String sdCode) {
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


}
