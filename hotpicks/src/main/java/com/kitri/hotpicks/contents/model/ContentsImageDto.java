package com.kitri.hotpicks.contents.model;

public class ContentsImageDto {
	private int contentsId;
	private String imgName;
	private String originImgurl;
	private String serialNum;
	private String smallImageUrl;
	public int getContentsId() {
		return contentsId;
	}
	public void setContentsId(int contentsId) {
		this.contentsId = contentsId;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getOriginImgurl() {
		return originImgurl;
	}
	public void setOriginImgurl(String originImgurl) {
		this.originImgurl = originImgurl;
	}
	public String getSerialNum() {
		return serialNum;
	}
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	public String getSmallImageUrl() {
		return smallImageUrl;
	}
	public void setSmallImageUrl(String smallImageUrl) {
		this.smallImageUrl = smallImageUrl;
	}
	@Override
	public String toString() {
		return "ContentsImageDto [contentsId=" + contentsId + ", imgName=" + imgName + ", originImgurl=" + originImgurl
				+ ", serialNum=" + serialNum + ", smallImageUrl=" + smallImageUrl + "]";
	}

	
	
}
