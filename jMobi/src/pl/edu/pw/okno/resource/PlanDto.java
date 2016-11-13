package pl.edu.pw.okno.resource;

import java.util.ArrayList;
import java.util.List;

public class PlanDto {

	private final String planName;
	private final List<SubjectDto> subjects;
	
	public PlanDto(String planName) {
		this.planName = planName;
		this.subjects = new ArrayList<>();
	}
	
	public void addSubject(SubjectDto dto) {
		subjects.add(dto);
	}
	
	public List<SubjectDto> getSubjects() {
		return subjects;
	}
	
	public String getPlanName() {
		return planName;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append("{ ");
		strBld.append(planName);
		strBld.append(" : ");
		strBld.append(subjects);
		strBld.append(" }");
		return strBld.toString();
	}
	
}
