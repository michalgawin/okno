package pl.edu.pw.okno.resource;

public class SubjectDto {

	private final String uri;
	private final String subjectName;
	
	public SubjectDto(String subjectName, String uri) {
		this.uri = uri;
		this.subjectName = subjectName;
	}
	
	public String getUri() {
		return uri;
	}
	
	public String getSubjectName() {
		return subjectName;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append("{ ");
		strBld.append(uri);
		strBld.append(" : ");
		strBld.append(subjectName);
		strBld.append(" }");
		return strBld.toString();
	}
	
}
