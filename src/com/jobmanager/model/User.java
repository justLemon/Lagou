package com.jobmanager.model;
/**
 * User”≥…‰¿‡
 * @author qcb
 * @time 2015.7.30s
 */
public class User {
	private String userName;
	private String userPasswd;
	private String userType;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	
//	@Override
//	public String toString() {
//		return "User [userId=" + userId + ", userName=" + userName
//				+ ", userAge=" + userAge + "]";
//	}

}
