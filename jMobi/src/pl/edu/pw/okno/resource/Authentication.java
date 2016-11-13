package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import com.codename1.io.NetworkManager;
import pl.edu.pw.okno.auth.Auth;
import pl.edu.pw.okno.auth.AuthImpl;
import pl.edu.pw.okno.exc.AuthError;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

public class Authentication extends AbsRequestHandler {

	private String token;
	private Auth auth;
	
	public Authentication(String uri) throws AuthError {
		super(uri);
	}
	
	public void requestFor() {
		setUrl("/token");
		setPostMethod();
		showUIProgress();
		sendRequest();
	}
	
	@Override
	public String getResults() {
		return token;
	}
	
	public void setAuthentication(String username, String password) throws AuthError {
		makeAuth(username, password);
		setAuthorizationHeader();
	}
	
	public void setAuthorization(String token) throws AuthError {
		makeAuth(token, "");
		setDefaultAuthorizationHeader(); /* Default authorization value for all requests */
	}
	
	protected void setAuthorizationHeader() {
		this.addRequestHeader("Authorization", auth.getAuthorization());
	}
	
	protected void setDefaultAuthorizationHeader() {
		NetworkManager.getInstance().addDefaultHeader("Authorization", auth.getAuthorization());
	}
	
	@Override
	protected void parse() {
		try {
			token = (String) getResultProperty().getProperty("token");
		} catch (KeyError ex) {
			Log.p(ex.getMessage(), Log.ERROR);
			throw new RuntimeException("Cannot get token");
		}
	}

	@Override
	protected void verify(int code, String message) {
		setStatusCode(code);
		Log.p("Error response: " + message, Log.DEBUG);
	}
	
	private void makeAuth(String username, String password) throws AuthError {
		auth = AuthImpl.getInstance();
		auth.setUsername(username.trim());
		auth.setPassword(password);
		auth.create();
	}

	/*private String readTokenFromResponse(ConnectionRequest request) {
		Map<String, Object> response;
		try {
			response = new JSONParser().parseJSON(new InputStreamReader(new ByteArrayInputStream(request.getResponseData()), "UTF-8"));
		} catch(IOException e) {
			response = new HashMap<String, Object>(){{ put("token", ""); }};
		}
		System.out.println(response.get("token"));
		return (String) response.get("token");
	}*/
	
}
