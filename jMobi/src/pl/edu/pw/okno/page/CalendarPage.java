package pl.edu.pw.okno.page;

import com.codename1.ui.Form;
import com.codename1.ui.layouts.BorderLayout;
import pl.edu.pw.okno.custom.ui.EventsCalendar;

import java.util.Date;

@MenuItem(itemName = "Kalendarz", order = 4)
public class CalendarPage extends AbsPage {

	private static class LazyPage {
		private static final CalendarPage INSTANCE = new CalendarPage();
	}
	private EventsCalendar cld = new EventsCalendar();
	
	public static CalendarPage getInstance() {
		return LazyPage.INSTANCE;
	}
	
	private CalendarPage() {
		super(new Form("Kalendarz", new BorderLayout()));
		addCalendar();
	}
	
	@Override
	protected void setContent() {
	}
	
	private void addCalendar() {
		cld.addActionListener((e) -> {
			showEvents();
		}); 
		getPage().add(BorderLayout.CENTER, cld); 
	}
	
	private void showEvents() {
		EventsPage eventsPage = new EventsPage(new Date(cld.getSelectedDay()), cld.getEventsOfMonth());
		eventsPage.setBackCommand(this.getPage());
		eventsPage.show	();
	}
	
}
