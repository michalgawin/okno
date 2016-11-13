package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.pagination.Pagination;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;
import pl.edu.pw.okno.utils.CalendarUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class GeneralPublication extends AbsRequestHandler implements Pagination {
	
	private List<PublicationDto> messages;
	private String uri;
	
	public GeneralPublication(String url, int limit) {
		super(url);
		this.messages = new ArrayList<PublicationDto>();
		setNextPage(0, limit);
	}
	
	@Override
	public void requestFor() {
		setUrl(uri);
		setGetMethod();
		showUIProgress();
		sendRequest();
	}
	
	@Override
	public List<PublicationDto> getResults() {
		return messages;
	}

	@Override
	protected void parse() {
		messages.clear();
		try {
			List<Map<String, Object>> response = (List<Map<String, Object>>) getResultProperty().getProperty("general");
			if (response != null) {
				for (Map<String, Object> element : response) {
					String author = (String) element.get("autor");
					String isoDate = (String) element.get("start");
					Date date = CalendarUtils.createDateFromIsoFormat(isoDate);
					String content = (String) element.get("tresc");
					String title = (String) element.get("tytul");
					Log.p(author + " " + date + " " + content + " " + title);
					PublicationDto message = new PublicationDto(author, CalendarUtils.getDateOutputFormat(date), content, title);
					messages.add(message);
				}
			}
		} catch(KeyError e) {
		}

		try {
			String uri = (String) getResultProperty().getProperty("uri");
			if (uri != null) {
				setNextPage(uri);
			}
		} catch(KeyError e) {
		}
	}

	@Override
	protected void verify(int code, String message) {
		Log.p("Error response: " + message, Log.ERROR);
		setStatusCode(code);
	}
	
	@Override
	public void setNextPage(String uri) {
		this.uri = uri;
	}

	@Override
	public void setNextPage(int offset, int limit) {
		uri = "/announce/general/" + offset + "/" + limit;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append("Size: " + strBld.length() + "\n");
		for(PublicationDto message : messages) {
			strBld.append("[" + message + "]\n");
		}
		return strBld.toString();
	}

}
