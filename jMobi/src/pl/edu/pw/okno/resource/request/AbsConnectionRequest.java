package pl.edu.pw.okno.resource.request;

import com.codename1.io.ConnectionRequest;

import java.io.InputStream;

public abstract class AbsConnectionRequest extends ConnectionRequest {
	
	@Override
	protected void postResponse() {
		parse();
	}
	
	@Override
	protected void readResponse(InputStream input) {
		read(input);
	}
	
	@Override
	protected void handleErrorResponseCode(int code, String message) {
		verify(code, message);
	}
	
	protected abstract void parse();
	protected abstract void read(InputStream input);
	protected abstract void verify(int code, String message);
	
}
