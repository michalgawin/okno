package pl.edu.pw.okno.resource;

import pl.edu.pw.okno.exc.KeyError;

public interface Property {
	
	public Object getProperty(String property) throws KeyError;
	public boolean hasProperty(String property);
	
}
