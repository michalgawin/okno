package pl.edu.pw.okno.utils;

import com.codename1.io.Log;
import com.codename1.l10n.DateFormat;
import com.codename1.l10n.ParseException;
import com.codename1.l10n.SimpleDateFormat;

import java.util.Date;

public class CalendarUtils {

	private static final SimpleDateFormat dateIsoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
	private static final SimpleDateFormat dateIsoShortFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static final DateFormat dateOutputFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	private static final DateFormat dateUrlFormat = new SimpleDateFormat("yyyy/MM/dd");
	
	public static java.util.Calendar resetHourMinSecMill(Date date) {
		java.util.Calendar calendar = java.util.Calendar.getInstance();
		if (date != null) {
			calendar.setTime(date);
		}
		calendar.set(java.util.Calendar.MILLISECOND, 0);
		calendar.set(java.util.Calendar.SECOND, 0);
		calendar.set(java.util.Calendar.MINUTE, 0);
		calendar.set(java.util.Calendar.HOUR_OF_DAY, 0);
		return calendar;
	}
	
	public static boolean isWithinYears(int year, java.util.Calendar start, java.util.Calendar end) {
		return ((start.get(java.util.Calendar.YEAR) < year)
				&&
				(end.get(java.util.Calendar.YEAR) > year));
	}
	
	public static boolean isToThisDayOrLater(int year, int month, int day, java.util.Calendar start, java.util.Calendar end) {
		return (((start.get(java.util.Calendar.YEAR) < year)
				&&
			(end.get(java.util.Calendar.YEAR) == year))
				&&
			(end.get(java.util.Calendar.MONTH) >= month)
				&&
			(end.get(java.util.Calendar.DAY_OF_MONTH) >= day));
	}
	
	public static boolean isFromThisDayOrBefore(int year, int month, int day, java.util.Calendar start, java.util.Calendar end) {
		return (((start.get(java.util.Calendar.YEAR) == year)
				&&
			(end.get(java.util.Calendar.YEAR) >= year))
				&&
			(start.get(java.util.Calendar.MONTH) <= month)
				&&
			(start.get(java.util.Calendar.DAY_OF_MONTH) <= day));
	}
	
	public static Date createDateFromIsoFormat(String isoDate) {
		Date date = null;
		try {
			date = dateIsoFormat.parse(isoDate);
		} catch (ParseException e) {
			Log.p("Cannoe parse datee " + isoDate, Log.WARNING);
		}
		return date;
	}
	
	public static Date createDateFromShortIsoFormat(String isoDate) {
		Date date = null;
		try {
			date = dateIsoShortFormat.parse(isoDate);
		} catch (ParseException e) {
			Log.p("Cannoe parse datee " + isoDate, Log.WARNING);
		}
		return date;
	}
	
	public static String getDateOutputFormat(Date date) {
		return dateOutputFormat.format(date);
	}
	
	public static String getDateShortOutputFormat(Date date) {
		return getDateUrlFormat(date);
	}
	
	public static String getDateUrlFormat(Date date) {
		return dateUrlFormat.format(date);
	}
	
}
