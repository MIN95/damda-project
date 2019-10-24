package com.bit.pro.vo;

public class EventVo {
	
	private int eventnum;
	private String eventsub;
	private String eventdateSta;
	private String eventdateEnd;
	private String eventcontent;
	
	//detail¿¡¼­ ¾µ
		private String photoCtg2;
		private int p_eventNum;
		private String photoPath;
		private String photoName;
		private String originalName;
		private int photoNum;
	
	public EventVo() {
		
	}

	public int getEventnum() {
		return eventnum;
	}

	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}

	public String getEventsub() {
		return eventsub;
	}

	public void setEventsub(String eventsub) {
		this.eventsub = eventsub;
	}

	public String getEventdateSta() {
		return eventdateSta;
	}

	public void setEventdateSta(String eventdateSta) {
		this.eventdateSta = eventdateSta;
	}

	public String getEventdateEnd() {
		return eventdateEnd;
	}

	public void setEventdateEnd(String eventdateEnd) {
		this.eventdateEnd = eventdateEnd;
	}

	public String getEventcontent() {
		return eventcontent;
	}

	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}

	public String getPhotoCtg2() {
		return photoCtg2;
	}

	public void setPhotoCtg2(String photoCtg2) {
		this.photoCtg2 = photoCtg2;
	}

	public int getP_eventNum() {
		return p_eventNum;
	}

	public void setP_eventNum(int p_eventNum) {
		this.p_eventNum = p_eventNum;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public int getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(int photoNum) {
		this.photoNum = photoNum;
	}

	@Override
	public String toString() {
		return "EventVo [eventnum=" + eventnum + ", eventsub=" + eventsub + ", eventdateSta=" + eventdateSta
				+ ", eventdateEnd=" + eventdateEnd + ", eventcontent=" + eventcontent + ", photoCtg2=" + photoCtg2
				+ ", p_eventNum=" + p_eventNum + ", photoPath=" + photoPath + ", photoName=" + photoName
				+ ", originalName=" + originalName + ", photoNum=" + photoNum + "]";
	}

	public EventVo(int eventnum, String eventsub, String eventdateSta, String eventdateEnd, String eventcontent,
			String photoCtg2, int p_eventNum, String photoPath, String photoName, String originalName, int photoNum) {
		super();
		this.eventnum = eventnum;
		this.eventsub = eventsub;
		this.eventdateSta = eventdateSta;
		this.eventdateEnd = eventdateEnd;
		this.eventcontent = eventcontent;
		this.photoCtg2 = photoCtg2;
		this.p_eventNum = p_eventNum;
		this.photoPath = photoPath;
		this.photoName = photoName;
		this.originalName = originalName;
		this.photoNum = photoNum;
	}

	
}
