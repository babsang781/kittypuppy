package com.kittypuppy.model;

public class FeedCommentDTO {
	
	private String fcNo;
	private String feedNo;
	private String nick;
	private String content;
	private String coDate;
	private String coUpdate;
	
	public FeedCommentDTO(String fcNo, String feedNo, String nick, String content, String coDate, String coUpdate) {
		super();
		this.fcNo = fcNo;
		this.feedNo = feedNo;
		this.nick = nick;
		this.content = content;
		this.coDate = coDate;
		this.coUpdate = coUpdate;
	}
	
	public String getFcNo() {
		return fcNo;
	}
	public void setFcNo(String fcNo) {
		this.fcNo = fcNo;
	}
	public String getFeedNo() {
		return feedNo;
	}
	public void setFeedNo(String feedNo) {
		this.feedNo = feedNo;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCoDate() {
		return coDate;
	}
	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}
	public String getCoUpdate() {
		return coUpdate;
	}
	public void setCoUpdate(String coUpdate) {
		this.coUpdate = coUpdate;
	}
	
}
