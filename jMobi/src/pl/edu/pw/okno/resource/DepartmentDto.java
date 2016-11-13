package pl.edu.pw.okno.resource;

public class DepartmentDto {

	private final int id;
	private final String departmentName;
	
	public DepartmentDto(int id, String departmentName) {
		this.id = id;
		this.departmentName = departmentName;
	}
	
	public int getId() {
		return id;
	}
	
	public String getDepartmentName() {
		return departmentName;
	}
	
	@Override
	public String toString() {
		StringBuilder strBld = new StringBuilder();
		strBld.append("{ ");
		strBld.append(id);
		strBld.append(" : ");
		strBld.append(departmentName);
		strBld.append(" }");
		return strBld.toString();
	}
	
}
