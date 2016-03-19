package model.beans;

import java.io.Serializable;
public class Appeals implements Serializable{
	private static final long serialVersionUID = 1L;
	String Username,comment;

	public Appeals(String Username ,String comment)
	{
		this.Username=Username;
		this.comment=comment;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}