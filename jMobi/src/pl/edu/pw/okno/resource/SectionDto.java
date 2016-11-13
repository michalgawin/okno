package pl.edu.pw.okno.resource;

import java.util.ArrayList;
import java.util.List;

public class SectionDto {

	private final String sectionName;
	private final List<PlanDto> plans;
	
	public SectionDto(String sectionName) {
		this.sectionName = sectionName;
		this.plans = new ArrayList<>();
	}
	
	public void addSubject(PlanDto dto) {
		plans.add(dto);
	}
	
	public List<PlanDto> getPlans() {
		return plans;
	}
	
	public String getSectionName() {
		return sectionName;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append("{ ");
		strBld.append(sectionName);
		strBld.append(" : ");
		strBld.append(plans);
		strBld.append(" }");
		return strBld.toString();
	}
	
}
