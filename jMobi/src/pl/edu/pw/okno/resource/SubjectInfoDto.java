package pl.edu.pw.okno.resource;

public class SubjectInfoDto {

	private String title;
	private String owner;
	private String objectives;
	private String description;
	private String bibliography;
	private Integer edition;
	
	public SubjectInfoDto(String title,
			String owner,
			String objectives,
			String description,
			String bibliography,
			Integer edition) {
		this.title = title;
		this.owner = owner;
		this.objectives = objectives;
		this.description = description;
		this.bibliography = bibliography;
		this.edition = edition;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getOwner() {
		return owner;
	}
	
	public String getObjectives() {
		return objectives;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getBibliography() {
		return bibliography;
	}
	
	public boolean isAvailable() {
		return edition >= 0;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append(title);
		strBld.append("{ ");
		strBld.append(owner);
		strBld.append(", ");
		strBld.append(objectives);
		strBld.append(", ");
		strBld.append(description);
		strBld.append(", ");
		strBld.append(bibliography);
		strBld.append(" }");
		return strBld.toString();
	}
	
}
