package pl.edu.pw.okno.page;

import com.codename1.components.SpanLabel;
import com.codename1.ui.Form;
import com.codename1.ui.layouts.BoxLayout;
import pl.edu.pw.okno.resource.EventDto;
import pl.edu.pw.okno.utils.CalendarUtils;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class EventsPage extends AbsPage {

	private static final String title = "Wydarzenia dnia";
	
	Date selectedDay = null;
	Map<java.util.Calendar, List<EventDto>> eventsInMonth;
	
	public EventsPage(Date day, Map<java.util.Calendar, List<EventDto>> eventsInMonth) {
		super(new Form(title, new BoxLayout(BoxLayout.Y_AXIS)));
		this.selectedDay = day;
		this.eventsInMonth = eventsInMonth;
	}
	
	@Override
	protected void setContent() {
		java.util.Calendar calendar = CalendarUtils.resetHourMinSecMill(selectedDay);
		List<EventDto> eventsInDay = eventsInMonth.get(calendar);
		
		if (eventsInDay != null) {
			for (EventDto event : eventsInDay) {
				SpanLabel label = new SpanLabel(event.toString());
				label.setUIID("MultiButton");
				getPage().add(label);
			}
		}
	}
	
}
