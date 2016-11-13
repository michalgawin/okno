package pl.edu.pw.okno.resource;

import com.codename1.io.JSONParser;
import com.codename1.io.Log;
import pl.edu.pw.okno.resource.pagination.Pagination;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class SpecificPublication extends AbsRequestHandler implements Pagination {
	
	private Map<String, Object> properties = null;
	private List<PublicationDto> messages;
	private final int department;
	private String uri;
	
	public SpecificPublication(String url, int department) {
		super(url);
		this.messages = new ArrayList<PublicationDto>();
		this.department = department;
		setNextPage(0, 5);
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
		List<Map<String, Object>> response = (List<Map<String, Object>>)properties.get("announces");
		String uri = (String)properties.get("uri");

		if (uri != null) {
			setNextPage(uri);
		}

		if (response != null) {
			for (Map<String, Object> element : response) {
				String author = (String) element.get("autor");
				String date = (String) element.get("start");
				String content = (String) element.get("tresc");
				Log.p(author + " " + date + " " + content);
				PublicationDto message = new PublicationDto(author, date, content);
				messages.add(message);
			}
		}
	}

	@Override
	protected void read(InputStream input) {
		try {
			JSONParser json = new JSONParser();
			properties = json.parseJSON(new InputStreamReader(input));
			System.out.println(properties.toString());
		} catch(IOException ex) {}
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
		uri = "/announce/const/" + department + "/" + offset + "/" + limit;
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
