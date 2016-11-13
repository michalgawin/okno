package pl.edu.pw.okno.resource.request;

import com.codename1.components.InfiniteProgress;
import com.codename1.io.Log;
import com.codename1.io.NetworkManager;
import com.codename1.ui.Dialog;
import pl.edu.pw.okno.resource.Property;
import pl.edu.pw.okno.resource.PropertyImpl;

import java.io.InputStream;

public abstract class AbsRequestHandler extends AbsConnectionRequest {

	private static final int STATUS_CODE_OK = 200;

	private Property property;
	private String uri;
	private int statusCode = STATUS_CODE_OK;

	public AbsRequestHandler() {
		this.uri = "";
	}
	
	public AbsRequestHandler(String uri) {
		this.uri = uri;
	}

	@Override
	protected void read(InputStream input) {
		property = PropertyImpl.loadJSON(input);
		Log.p(property.toString(), Log.DEBUG);
	}

	@Override
	public void setUrl(String url) {
		super.setUrl(uri + url);
	}

	protected Property getResultProperty() {
		return property;
	}
	
	protected void showUIProgress() {
		InfiniteProgress progress = new InfiniteProgress();
		Dialog dlg = progress.showInifiniteBlocking();
		this.setDisposeOnCompletion(dlg);
	}
	
	protected void sendRequest() {
		NetworkManager.getInstance().addToQueueAndWait(this);
	}
	
	protected void setPostMethod() {
		this.setPost(true);
	}
	
	protected void setGetMethod() {
		this.setPost(false);
	}
	
	protected void setPutMethod() {
		this.setPost(false);
		this.setHttpMethod("PUT");
	}
	
	protected void setStatusCode(int code) {
		statusCode = code;
	}
	
	public boolean isOK() {
		return getStatusCode() == STATUS_CODE_OK;
	}
	
	private int getStatusCode() {
		return statusCode;
	}
	
	public abstract void requestFor();
	public abstract Object getResults();
	
}
