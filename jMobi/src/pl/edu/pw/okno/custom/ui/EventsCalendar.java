package pl.edu.pw.okno.custom.ui;

import com.codename1.io.Log;
import com.codename1.ui.Button;
import com.codename1.ui.Calendar;
import pl.edu.pw.okno.page.Properties;
import pl.edu.pw.okno.resource.Event;
import pl.edu.pw.okno.resource.EventDto;
import pl.edu.pw.okno.utils.CalendarUtils;

import java.util.*;

public class EventsCalendar extends Calendar {

	private List<EventDto> events = new ArrayList<EventDto>();
	Map<java.util.Calendar, List<EventDto>> eventsOfMonth = new HashMap<>();
	private String lastVisitedMonth = "";
	
	public EventsCalendar() {
		super();
	}
	
	public EventsCalendar(long time) {
		super(time);
	}
	
	public EventsCalendar(long time, TimeZone tmz) {
		super(time, tmz);
	}
	
	public void fetchOnCalendarChange(int year, int month, int day) {
		String currentMonth = Integer.toString(year) + "." + Integer.toString(month);
		if ((lastVisitedMonth == null) || !lastVisitedMonth.equals(currentMonth)) {
			eventsOfMonth = new HashMap<>();
			fetchData(year, month, day);
			lastVisitedMonth = currentMonth;
		}
	}
	
	private void fetchData(int year, int month, int day) {
		try {
			java.util.Calendar calendar = java.util.Calendar.getInstance();
			calendar.set(java.util.Calendar.YEAR, year);
			calendar.set(java.util.Calendar.MONTH, month);
			calendar.set(java.util.Calendar.DAY_OF_MONTH, 1);
			Event event = new Event(Properties.getInstance().getUrl(), calendar);
			//Display.getInstance().callSeriallyAndWait(() -> event.requestFor());
			event.requestFor();
        	events = event.getResults();
        	Log.p("Events: " + events, Log.DEBUG);
        } catch(Exception ex) {
        	ex.printStackTrace();
        }
	}
	
	@Override
    protected Button createDay() {
        //Customize your button here
        Button day = new Button();
        day.setAlignment(CENTER);
        day.setUIID("CalendarDay");
        day.setEndsWith3Points(false);
        day.setTickerEnabled(false);
        return day;
    }
	
	@Override
    protected void updateButtonDayDate(Button dayButton, int year, int month, int day) {
        //Customize day values
		fetchOnCalendarChange(year, month, day);
		int counter = 0;
		for (EventDto event : events) {
			java.util.Calendar calendarStart = java.util.Calendar.getInstance();
			calendarStart.setTime(event.getStartDate());
			java.util.Calendar calendarEnd = java.util.Calendar.getInstance();
			calendarEnd.setTime(event.getEndDate());
			
			if (CalendarUtils.isWithinYears(year, calendarStart, calendarEnd)
				||
				CalendarUtils.isToThisDayOrLater(year, month, day, calendarStart, calendarEnd)
				||
				CalendarUtils.isFromThisDayOrBefore(year, month, day, calendarStart, calendarEnd)
				) {
					counter += 1;
					java.util.Calendar date = CalendarUtils.resetHourMinSecMill(null);
					date.set(java.util.Calendar.DAY_OF_MONTH, day);
					date.set(java.util.Calendar.MONTH, month);
					date.set(java.util.Calendar.YEAR, year);
					
					List<EventDto> eventsInDay = this.eventsOfMonth.get(date);
					if (eventsInDay == null) {
						this.eventsOfMonth.put(date, eventsInDay=new ArrayList<>());
					}
					eventsInDay.add(event);
				}
		}
		String decor = "";
		if(counter > 0) {
			decor = "*";
		}
		dayButton.setText(day+decor);
    }
	
	public Map<java.util.Calendar, List<EventDto>> getEventsOfMonth() {
		return eventsOfMonth;
	}
	
	public static class VisitedDate {
		
		private Integer year = null;
		private Integer month = null;
		private Integer day = null;
		
		public VisitedDate() {
		}
		
		public VisitedDate(int year, int month, int day) {
			this.year = year;
			this.month = month;
			this.day = day;
		}
		
		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			
			VisitedDate other = (VisitedDate) obj;
			return (year.equals(other.year) &&
					month.equals(other.month));
		}
		
	}
	
}
