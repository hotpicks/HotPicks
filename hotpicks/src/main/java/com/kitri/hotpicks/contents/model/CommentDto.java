package com.kitri.hotpicks.contents.model;

public class CommentDto {

	private int seq;
	private String logId;
	private String logTime;
	private String content;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getLogTime() {
		return logTime;
	}
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "CommentDto [seq=" + seq + ", logId=" + logId + ", logTime=" + logTime + ", content=" + content + "]";
	}
	
	
}
