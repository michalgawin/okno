package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

public class Subject extends AbsRequestHandler {
	
	private SubjectInfoDto subject;
	private String uri;
	
	public Subject(String url, String uri) {
		super(url);
		this.uri = uri;
		this.subject = null;
	}
	
	@Override
	public void requestFor() {
		setUrl(uri);
		setGetMethod();
		showUIProgress();
		sendRequest();
	}
	
	@Override
	public SubjectInfoDto getResults() {
		return subject;
	}

	@Override
	protected void parse() {
		try {
			Property properties = getResultProperty();
			String title = (String) properties.getProperty("nazwa");
			String owner = (String) properties.getProperty("prowadzacy");
			String objectives = (String) properties.getProperty("cel");
			String description = (String) properties.getProperty("opis");
			String bibliography = (String) properties.getProperty("bibliografia");
			Integer edition = ((Double) properties.getProperty("edycja")).intValue();

			Log.p(title + " -> " + owner);
			subject = new SubjectInfoDto(title, owner, objectives, description, bibliography, edition);
		} catch (KeyError e) {
		}
	}

	@Override
	protected void verify(int code, String message) {
		Log.p("Error response: " + message, Log.ERROR);
		setStatusCode(code);
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append(subject.getTitle() + " -> { ");
		strBld.append(subject.getOwner() + ", ");
		strBld.append(subject.getObjectives() + ", ");
		strBld.append(subject.getDescription() + ", ");
		strBld.append(subject.getBibliography() + " }");
		return strBld.toString();
	}

}
