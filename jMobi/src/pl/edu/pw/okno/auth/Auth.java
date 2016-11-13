package pl.edu.pw.okno.auth;

import pl.edu.pw.okno.exc.AuthError;

public interface Auth extends Credentials {

	public void setMethod(AuthMethod auth);
	public void create() throws AuthError;
	public String getAuthorization();
	
}
