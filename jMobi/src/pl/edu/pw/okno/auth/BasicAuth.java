package pl.edu.pw.okno.auth;

import com.codename1.io.Log;
import com.codename1.util.Base64;

public class BasicAuth implements AuthMethod {

	private String encodedAuthorization;
	
	public BasicAuth() {
		encodedAuthorization = null;
	}

	@Override
	public void create(Credentials credentials) {
		String cred = credentials.getUsername() + ":" + credentials.getPassword();
		encodedAuthorization = "Basic " + Base64.encodeNoNewline(cred.getBytes()).trim(); /* Known issue - JDK-6459815 */
		
		Log.p("encoded authorization: " + encodedAuthorization, Log.INFO);
	}
	
	public String get() {
		return encodedAuthorization;
	}
	
}
