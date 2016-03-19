package model;
import java.io.Serializable;
public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	private String NETID, role, exam;;
	private int team_ID, mem_ID;
	public String getNETID() {
		return NETID;
	}
	public void setNETID(String nETID) {
		NETID = nETID;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getExam() {
		return exam;
	}
	public void setExam(String exam) {
		this.exam = exam;
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

}
