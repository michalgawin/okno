package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

import java.util.Map;

public class Subjects extends AbsRequestHandler {
	
	private DivisionDto divisiondto = new DivisionDto("");
	
	public Subjects(String uri) {
		super(uri);
	}
	
	@Override
	public void requestFor() {
		setUrl("/subject");
		setGetMethod();
		showUIProgress();
		sendRequest();
	}
	
	@Override
	public DivisionDto getResults() {
		return divisiondto;
	}

	@Override
	protected void parse() {
		try {
			java.util.List<Map<String, Object>> response = (java.util.List<Map<String, Object>>) getResultProperty().getProperty("subjects");
			for (Map<String, Object> section : response) {
				String sectionName = (String) section.get("name");
				SectionDto sectiondto = new SectionDto(sectionName);

				java.util.List<Map<String, Object>> plans = (java.util.List<Map<String, Object>>) section.get("plans");
				for (Map<String, Object> plan : plans) {
					String planName = (String) plan.get("name");
					PlanDto plandto = new PlanDto(planName);

					java.util.List<Map<String, Object>> subjects = (java.util.List<Map<String, Object>>) plan.get("subjects");
					for (Map<String, Object> subject : subjects) {
						String uri = (String) subject.get("uri");
						String subjectName = (String) subject.get("name");
						SubjectDto subjectdto = new SubjectDto(subjectName, uri);
						plandto.addSubject(subjectdto);
					}
					sectiondto.addSubject(plandto);
				}
				divisiondto.addSection(sectiondto);
			}
			Log.p(divisiondto.toString(), Log.DEBUG);
		} catch(KeyError e) {
		}
	}

	@Override
	protected void verify(int code, String message) {
		Log.p("Error response: " + message, Log.ERROR);
		setStatusCode(code);
	}
	
}
