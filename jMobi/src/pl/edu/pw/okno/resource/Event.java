package pl.edu.pw.okno.resource;

import com.codename1.io.Log;
import pl.edu.pw.okno.exc.KeyError;
import pl.edu.pw.okno.resource.request.AbsRequestHandler;
import pl.edu.pw.okno.utils.CalendarUtils;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

public class Event extends AbsRequestHandler {
	
	private java.util.Calendar calendar;
	private List<EventDto> events;
	
	public Event(String uri, java.util.Calendar calendar) {
		super(uri);
		this.calendar = calendar;
		events = new ArrayList<EventDto>();
	}
	
	@Override
	public void requestFor() {
		setGetMethod();
		setUrl("/calendar/" + CalendarUtils.getDateUrlFormat(calendar.getTime()));
		addArgument("days", Integer.toString(getDaysInMonth()));
		
		showUIProgress();
		sendRequest();
	}
	
	private int getDaysInMonth() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(calendar.getTime());
		return getLastDayOfMonth(calendar);
	}
	
	private int getLastDayOfMonth(Calendar calendar) {
		calendar.add(Calendar.MONTH, 1);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	@Override
	public List<EventDto> getResults() {
		return events;
	}

	@Override
	protected void parse() {
		try {
			java.util.List<Map<String, Object>> response = (java.util.List<Map<String, Object>>) getResultProperty().getProperty("calendar");
			for (Map<String, Object> element : response) {
				String start = (String) element.get("start");
				String end = (String) element.get("koniec");
				String title = (String) element.get("nazwa");

				addEvent(title, start, end);
			}
		} catch(KeyError e) {
		}
	}
	
	private void addEvent(String title, String start, String end) {
		EventDto event = new EventDto(title,
				CalendarUtils.createDateFromShortIsoFormat(start),
				CalendarUtils.createDateFromShortIsoFormat(end));
		events.add(event);
	}

	@Override
	protected void verify(int code, String message) {
		Log.p("Error response: " + message, Log.ERROR);
		setStatusCode(code);
	}
	
}
