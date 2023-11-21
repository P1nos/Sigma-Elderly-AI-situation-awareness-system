package com.test;

public class memberDTO {
	String id;
	String password;
	String name;
	String phonenumber;
	String email;
	String age;
	String height;
	String Weight;
	String bloodtype;
	String Carrierdisease;
	
	
	public memberDTO(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
	public String getId() {
		return id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getName() {
		return name;
	}

	public String getPhonenumber() {
		return phonenumber;
	}
	
	public String getEmail() {
		return email;
	}

	public String getAge() {
		return age;
	}

	public String getHeight() {
		return height;
	}

	public String getWeight() {
		return Weight;
	}

	public String getBloodtype() {
		return bloodtype;
	}

	public String getCarrierdisease() {
		return Carrierdisease;
	}

	public void setId(String id) {
		this.id = id;
	}	
}
