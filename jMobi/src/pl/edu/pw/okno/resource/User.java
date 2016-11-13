package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

public class User extends AbsRequestHandler {
	
	private UserDto user = null;
	
	public User(String uri) {
		super(uri);
	}
	
	@Override
	public void requestFor() {
		setUrl("/token");
		setGetMethod();
		showUIProgress();
		sendRequest();
	}
	
	@Override
	public UserDto getResults() {
		return user;
	}
	
	@Override
	protected void parse() {
		try {
			Property properties = getResultProperty();
			String username = (String) properties.getProperty("Name"); //TODO - remove upper-case
			String lastname = (String) properties.getProperty("Lastname"); //TODO - remove upper-case
			String email = (String) properties.getProperty("email");
			String phone = (String) properties.getProperty("phone");
			String birthday = (String) properties.getProperty("birth");
			user = new UserDto(username, lastname, email, phone, birthday);
		} catch(KeyError e) {
		}
	}


	@Override
	protected void verify(int code, String message) {
		Log.p("Error response: " + message, Log.ERROR);
		setStatusCode(code);
	}
	
}
