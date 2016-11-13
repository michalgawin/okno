package pl.edu.pw.okno.auth;

import pl.edu.pw.okno.exc.AuthError;

import static com.codename1.testing.TestUtils.assertNotEqual;

public class AuthImpl implements Auth {

	private static final AuthImpl INSTANCE = new AuthImpl();
	
	private String username;
	private String password;
	private static AuthMethod authorization = null;
	
		public static AuthImpl getInstance() {
		return INSTANCE;
	}
	
	private AuthImpl() {
		this.username = null;
		this.password = null;
	}
	
	public AuthImpl(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	@Override
	public void setUsername(String username) throws IllegalArgumentException {
		assertNotEqual(username, null, "Attempt to set invalid username");
		this.username = username;
	}
	
	@Override
	public String getUsername() throws IllegalArgumentException {
		assertNotEqual(username, null, "username equal null");
		return username.trim();
	}
	
	@Override
	public void setPassword(String password) throws IllegalArgumentException {
		assertNotEqual(password, null, "Attempt to set invalid password");
		this.password = password.trim();
	}
	
	@Override
	public String getPassword() throws IllegalArgumentException {
		assertNotEqual(password, null, "password equal null");
		return password;
	}
	
	@Override
	public void setMethod(AuthMethod authorization) {
		assertNotEqual(authorization, null, "Attempt to set invalid authorization method");
		AuthImpl.authorization = authorization;
	}
	
	@Override
	public void create() throws AuthError {
		assertNotEqual(authorization, null, "Invalid auth method");
		authorization.create(this);
	}
	
	@Override
	public String getAuthorization() {
		assertNotEqual(authorization, null, "Invalid auth method");
		return authorization.get();
	}

}
