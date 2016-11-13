package pl.edu.pw.okno.resource;

public class PublicationDto {

	private static String uri;
	private final String author;
	private final String date;
	private final String message;
	private final String title;
	
	public PublicationDto(String author, String date, String message) {
		this(author, date, message, null);
	}
	
	public PublicationDto(String author, String date, String message, String title) {
		this.author = author;
		this.date = date;
		this.message = message;
		this.title = title;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public String getDate() {
		return date;
	}
	
	public String getMessage() {
		return message;
	}
	
	public String getTitle() {
		return title;
	}
	
	public static void setUri(String uri) {
		PublicationDto.uri = uri;
	}
	
	public static String getUri() {
		return PublicationDto.uri;
	}
	
	@Override
	public String toString() {
		return new String(uri + "->" + title + "|" + author + "|" + date);
	}
	
}
