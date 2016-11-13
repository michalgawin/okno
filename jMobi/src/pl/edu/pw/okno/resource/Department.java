package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Department extends AbsRequestHandler {
	
	private List<DepartmentDto> departments;
	
	public Department(String uri) {
		super(uri);
		departments = new ArrayList<>();
	}
	
	@Override
	public void requestFor() {
		setUrl("/department");
		setGetMethod();
		showUIProgress();
		sendRequest();
	}
	
	@Override
	public List<DepartmentDto> getResults() {
		return departments;
	}

	@Override
	protected void parse() {
		try {
			java.util.List<Map<String, Object>> response = (java.util.List<Map<String, Object>>) getResultProperty().getProperty("department");
			for (Map<String, Object> element : response) {
				int id = (int) (double) element.get("id");
				String departmentName = (String) element.get("name");
				departments.add(new DepartmentDto(id, departmentName));
			}
		} catch (KeyError e) {
		}
	}

	@Override
	protected void verify(int code, String message) {
		Log.p("Error response: " + message, Log.ERROR);
		setStatusCode(code);
	}
		
}
