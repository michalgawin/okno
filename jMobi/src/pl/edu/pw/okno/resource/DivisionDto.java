package pl.edu.pw.okno.resource;

import java.util.ArrayList;
import java.util.List;

public class DivisionDto {

	private final String divisionName;
	private final List<SectionDto> sections;
	
	public DivisionDto(String divisionName) {
		this.divisionName = divisionName;
		this.sections = new ArrayList<>();
	}
	
	public void addSection(SectionDto dto) {
		sections.add(dto);
	}
	
	public List<SectionDto> getSections() {
		return sections;
	}
	
	public String getDivisionName() {
		return divisionName;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append("{ ");
		strBld.append(divisionName);
		strBld.append(" : ");
		strBld.append(sections);
		strBld.append(" }");
		return strBld.toString();
	}
	
}
