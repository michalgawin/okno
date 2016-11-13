package pl.edu.pw.okno.page;

import com.codename1.ui.BrowserComponent;
import com.codename1.ui.Form;
import com.codename1.ui.layouts.BorderLayout;

public class BrowserPage extends AbsPage {

	private String htmlContent;
	
	public BrowserPage(String title, String htmlContent) {
		super(new Form(title, new BorderLayout()));
		this.htmlContent = htmlContent;
	}
	
	@Override
	protected void setContent() {
		/*String table = "<table style=\"width:100%\">"
				+ "<tr>"
				+ "<td>Jill</td>"
				+ "<td>Smith</td>"
				+ "<td>50</td>"
				+ "</tr>"
				+ "<tr>"
				+ "<td>Eve</td>"
				+ "<td>Jackson</td> "
				+ "<td>94</td>"
				+ "</tr>"
				+ "</table> ";
		String html = "<html>"
				+ "<title>Hej</title>"
				+ "<body>"
				+ table
				+ "</body>"
				+ "</html>";*/
		
		getPage().setScrollable(true);
		getPage().setScrollVisible(true);
		
		BrowserComponent browser = new BrowserComponent();
		browser.setScrollable(true);
		browser.setScrollVisible(true);
		browser.setUIID("PopupBody");
		browser.setPage(htmlContent, "pw.edu.pl");
		
		getPage().add(BorderLayout.CENTER, browser);
	}
	
}
