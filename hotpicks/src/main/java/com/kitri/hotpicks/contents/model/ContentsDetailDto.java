package com.kitri.hotpicks.contents.model;

import java.util.List;

public class ContentsDetailDto extends ContentsDto {

	private String homePage;
	private String telName;
	private String tel;
	private String zipCode;
	private String addr1;
	private String addr2;
	private double xPoint;
	private double yPoint;
	
	private String program;
	private String usetime;
	private String eventStartDate;
	private String eventEndDate;
	private String playtime;
	private String spendtime;
	private String ageLimit;
	private String bookingPlace;
	private String discountInfo;
	private String placeInfo;
	
	
	private String infoSogae;
	private String infoNaeyong;
	public String getHomePage() {
		return homePage;
	}
	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}
	public String getTelName() {
		return telName;
	}
	public void setTelName(String telName) {
		this.telName = telName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public double getxPoint() {
		return xPoint;
	}
	public void setxPoint(double xPoint) {
		this.xPoint = xPoint;
	}
	public double getyPoint() {
		return yPoint;
	}
	public void setyPoint(double yPoint) {
		this.yPoint = yPoint;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	public String getUsetime() {
		return usetime;
	}
	public void setUsetime(String usetime) {
		this.usetime = usetime;
	}
	public String getEventStartDate() {
		return eventStartDate;
	}
	public void setEventStartDate(String eventStartDate) {
		this.eventStartDate = eventStartDate;
	}
	public String getEventEndDate() {
		return eventEndDate;
	}
	public void setEventEndDate(String eventEndDate) {
		this.eventEndDate = eventEndDate;
	}
	public String getPlaytime() {
		return playtime;
	}
	public void setPlaytime(String playtime) {
		this.playtime = playtime;
	}
	public String getSpendtime() {
		return spendtime;
	}
	public void setSpendtime(String spendtime) {
		this.spendtime = spendtime;
	}
	public String getAgeLimit() {
		return ageLimit;
	}
	public void setAgeLimit(String ageLimit) {
		this.ageLimit = ageLimit;
	}
	public String getBookingPlace() {
		return bookingPlace;
	}
	public void setBookingPlace(String bookingPlace) {
		this.bookingPlace = bookingPlace;
	}
	public String getDiscountInfo() {
		return discountInfo;
	}
	public void setDiscountInfo(String discountInfo) {
		this.discountInfo = discountInfo;
	}
	public String getPlaceInfo() {
		return placeInfo;
	}
	public void setPlaceInfo(String placeInfo) {
		this.placeInfo = placeInfo;
	}
	public String getInfoSogae() {
		return infoSogae;
	}
	public void setInfoSogae(String infoSogae) {
		this.infoSogae = infoSogae;
	}
	public String getInfoNaeyong() {
		return infoNaeyong;
	}
	public void setInfoNaeyong(String infoNaeyong) {
		this.infoNaeyong = infoNaeyong;
	}
	@Override
	public String toString() {
		return "ContentsDetailDto [homePage=" + homePage + ", telName=" + telName + ", tel=" + tel + ", zipCode="
				+ zipCode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", xPoint=" + xPoint + ", yPoint=" + yPoint
				+ ", program=" + program + ", usetime=" + usetime + ", eventStartDate=" + eventStartDate
				+ ", eventEndDate=" + eventEndDate + ", playtime=" + playtime + ", spendtime=" + spendtime
				+ ", ageLimit=" + ageLimit + ", bookingPlace=" + bookingPlace + ", discountInfo=" + discountInfo
				+ ", placeInfo=" + placeInfo + ", infoSogae=" + infoSogae + ", infoNaeyong=" + infoNaeyong + "]";
	}
	
	
	
	


	
}
