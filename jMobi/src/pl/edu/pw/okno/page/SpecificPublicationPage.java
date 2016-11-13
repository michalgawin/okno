package pl.edu.pw.okno.page;

import com.codename1.components.SpanButton;
import com.codename1.ui.Form;
import com.codename1.ui.layouts.BoxLayout;
import pl.edu.pw.okno.resource.DepartmentDto;
import pl.edu.pw.okno.resource.PublicationDto;
import pl.edu.pw.okno.resource.SpecificPublication;

import java.util.ArrayList;
import java.util.List;

@MenuItem(itemName = "Ogłoszenia wydziałowe", order = 2)
public class SpecificPublicationPage extends AbsPage {

	SpecificPublication announce;
	List<PublicationDto> data = new ArrayList<>();
	
	public SpecificPublicationPage(DepartmentDto department) {
		super(new Form(department.getDepartmentName(), new BoxLayout(BoxLayout.Y_AXIS)));
		announce = new SpecificPublication(Properties.getInstance().getUrl(), department.getId());
	}
	
	@Override
	protected void setContent() {
		List<PublicationDto> newMessages = fetchData();
		data.addAll(newMessages);
		updateDataOnScreen(newMessages);
	}
	
	private List<PublicationDto> fetchData() {
		List<PublicationDto> messages = new ArrayList<>();
		try {
        	announce.requestFor();
        	messages = announce.getResults();
        } catch(Exception ex) {
        	ex.printStackTrace();
        }
		return messages;
	}
	
	private void updateDataOnScreen(List<PublicationDto> entries) {
		for (PublicationDto entry : entries) {
			SpanButton button = new SpanButton(entry.getMessage().substring(0, 60) + "...");
			button.setUIID("MultiButton");
	        
			button.addActionListener((e) -> {
				NavigationPage navigation = new BrowserPage("",
						entry.getMessage() + createFootprint(entry.getAuthor(), entry.getDate()));
				navigation.setBackCommand(DepartmentsPage.getInstance().getPage());
				navigation.show();
			});
			
			getPage().add(button);
		}
		
		getPage().getContentPane().addPullToRefresh(new Runnable() {
			public void run() {
				setContent();
				getPage().revalidate();
			}
		});
	}
	
	private String createFootprint(String author, String date) {
		String newLine = "</br>";
		String startAlignRight = "<div align=\"right\">";
		String endAlignRight = "</div>";
		String startItalic = "<i>";
		String endItalic = "</i>";
		
		StringBuilder footprint = new StringBuilder();
		footprint.append(newLine).append(newLine).append(newLine);
		footprint.append(startAlignRight).append(startItalic);
		footprint.append(author).append(newLine).append(date);
		footprint.append(endItalic).append(endAlignRight);
		
		return footprint.toString();
	}
	
}
