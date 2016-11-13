package pl.edu.pw.okno.resource;

import pl.edu.pw.okno.utils.CalendarUtils;

import java.util.Date;

public class EventDto {
	
	private Date start;
	private Date end;
	private String title;
	
	public EventDto(String title, Date start) {
		this(title, start, start);
	}
	
	public EventDto(String title, Date start, Date end) {
		this.title = title;
		this.start = start;
		this.end = end;
	}
	
	public Date getStartDate() {
		return start;
	}
	
	public Date getEndDate() {
		return end;
	}
	
	public String getTitle() {
		return title;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append(title);
		strBld.append("\n(" + CalendarUtils.getDateShortOutputFormat(start) + " - " + CalendarUtils.getDateShortOutputFormat(end) + ")");
		return strBld.toString();
	}
	
	@Override
	public boolean equals(Object otherObject) {
		if (this == otherObject)
			return true;
		if (otherObject == null)
			return false;
		if (getClass() != otherObject.getClass())
			return false;
		EventDto other = (EventDto) otherObject;
		return compare(start, other.start) &&
				compare(end, other.end) &&
				compare(title, other.title);
	}
	
	private boolean compare(Object a, Object b) {
		if ((a == null) && (b == null))
			return true;
		if ((a == null) || (b == null))
			return false;
		return a.equals(b);
	}
	
}
