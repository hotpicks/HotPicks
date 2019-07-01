package com.kitri.hotpicks.mypicks.model;

import java.util.List;

public class SelectMapContentsDto {
	private List<String> selectContents;
	private double x;
	private double y;
	private int selectDistance;//계산기준 거리
	private int getDistance;//내위치로부터 거리
	
	public List<String> getSelectContents() {
		return selectContents;
	}
	public void setSelectContents(List<String> selectContents) {
		this.selectContents = selectContents;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public int getSelectDistance() {
		return selectDistance;
	}
	public void setSelectDistance(int selectDistance) {
		this.selectDistance = selectDistance;
	}
	public int getGetDistance() {
		return getDistance;
	}
	public void setGetDistance(int getDistance) {
		this.getDistance = getDistance;
	}
	@Override
	public String toString() {
		return "SelectMapContents [selectContents=" + selectContents + ", x=" + x + ", y=" + y + ", selectDistance="
				+ selectDistance + ", getDistance=" + getDistance + "]";
	}
	
	
}
