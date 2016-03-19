package model.beans;

import java.sql.Date;

public class MessageBean {
	private String message;
	private int team_ID;
	private int mem_ID;
	private String timestamp;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getTeam_ID() {
		return team_ID;
	}
	public void setTeam_ID(int team_ID) {
		this.team_ID = team_ID;
	}
	public int getMem_ID() {
		return mem_ID;
	}
	public void setMem_ID(int mem_ID) {
		this.mem_ID = mem_ID;
	}
	public String getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(String date) {
		this.timestamp = date;
	}
};
