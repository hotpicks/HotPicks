package com.kitri.hotpicks.member.model;

public class MemberDto {
	
	private String userId;
	private String pass;
	private String name;
	private String age;
	private String gender;
	private String joinDate;
	private int enable;
	private String profile;
	
	private String newpass; // 새 비밀번호 (수정)

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

	@Override
	public String toString() {
		return "MemberDto [userId=" + userId + ", pass=" + pass + ", name=" + name + ", age=" + age + ", gender="
				+ gender + ", joinDate=" + joinDate + ", enable=" + enable + ", profile=" + profile + ", newpass="
				+ newpass + "]";
	}
	
	
}
