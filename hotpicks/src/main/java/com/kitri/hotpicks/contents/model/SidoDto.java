package com.kitri.hotpicks.contents.model;

public class SidoDto {
	
	private int sdCode;
	private String sdName;
	
	public int getSdCode() {
		return sdCode;
	}
	public void setSdCode(int sdCode) {
		this.sdCode = sdCode;
	}
	public String getSdName() {
		return sdName;
	}
	public void setSdName(String sdName) {
		this.sdName = sdName;
	}
	@Override
	public String toString() {
		return "SidoDto [sdCode=" + sdCode + ", sdName=" + sdName + "]";
	}
	

	
}
