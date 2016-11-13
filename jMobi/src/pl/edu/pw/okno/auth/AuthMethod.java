package pl.edu.pw.okno.auth;

public interface AuthMethod {

	public void create(Credentials credentials);
	public String get();
	
}
