package pl.edu.pw.okno.resource.pagination;

public interface Pagination {
	
	public void setNextPage(String uri);
	public void setNextPage(int offset, int limit);
	
}
