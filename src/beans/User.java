package beans;

public class User {
	private int id;
	private String username;
	private String password;
	private String occupation;
	public User() {
		super();
	}
	
	

	
	public User(int id, String username, String occupation) {
		super();
		this.id = id;
		this.username = username;
		this.occupation = occupation;
	}


	

	public User(String username, String password, String occupation) {
		super();
		this.username = username;
		this.password = password;
		this.occupation = occupation;
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
	
}
