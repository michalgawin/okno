package pl.edu.pw.okno.page;

import static com.codename1.testing.TestUtils.assertNotEqual;

public class Properties {

	private static final Properties INSTANCE = new Properties();
	
	private String url = null;
	
	public static Properties getInstance() {
		return INSTANCE;
	}
	
	private Properties() {
	}
	
	public String getUrl() {
		assertNotEqual(url, null, "URL not set");
		return url;
	}
	
	public void setUrl(String url) {
		assertNotEqual(url, null, "Cannot set invalid URL");
		this.url = url;
	}
	
}
