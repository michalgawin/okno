package pl.edu.pw.okno.resource;

public class UserDto {

	private String username;
	private String lastname;
	private String email;
	private String phone;
	private String birthday;
	
	public UserDto(String username, String lastname, String email, String phone, String birthday) {
		this.username = username;
		this.lastname = lastname;
		this.email = email;
		this.phone = phone;
		this.birthday = birthday;
	}
	
	public String getUsername() {
		return username;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public String getEmail() {
		return email;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public String getBirthday() {
		return birthday;
	}
	
}
