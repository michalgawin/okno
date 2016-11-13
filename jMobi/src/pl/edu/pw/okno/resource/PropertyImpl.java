package pl.edu.pw.okno.resource;

import com.codename1.io.JSONParser;
import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

public class PropertyImpl implements Property {

	private Map<String, Object> properties;
	
	public static Property loadJSON(InputStream input) {
		Map<String, Object> properties = null;
		try {
			JSONParser json = new JSONParser();
			properties = json.parseJSON(new InputStreamReader(input));
		} catch(IOException e) {
			Log.p(e.getMessage(), Log.ERROR);
		}
		return new PropertyImpl(properties);
	}
	
	private PropertyImpl(Map<String, Object> properties) {
		this.properties = properties;
	}
	
	@Override
	public Object getProperty(String property) throws KeyError {
		return tryGetProperty(property);
	}
	
	@Override
	public boolean hasProperty(String property) {
		return properties.containsKey(property);
	}
	
	private Object tryGetProperty(String property) throws KeyError {
		if (!hasProperty(property)) {
			throw new KeyError("No key '" + property + "'");
		}
		Object value = properties.get(property);
		Log.p(property + "=" + value.toString());
		return value;
	}
	
	@Override
	public String toString() {
		return properties.toString();
	}
	
}
