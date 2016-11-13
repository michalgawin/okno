package pl.edu.pw.okno.page;

import com.codename1.components.SpanButton;
import com.codename1.ui.Form;
import com.codename1.ui.layouts.BoxLayout;
import pl.edu.pw.okno.resource.GeneralPublication;
import pl.edu.pw.okno.resource.PublicationDto;

import java.util.ArrayList;
import java.util.List;

@MenuItem(itemName = "Ogłoszenia ogólne", order = 1)
public class GeneralPublicationPage extends AbsPage {

	private static class LazyPage {
		private static final GeneralPublicationPage INSTANCE = new GeneralPublicationPage();
	}
	GeneralPublication announce;
	List<PublicationDto> data = new ArrayList<>();

	public static GeneralPublicationPage getInstance() {
		return LazyPage.INSTANCE;
	}
	
	private GeneralPublicationPage() {
		super(new Form("Ogłoszenia", new BoxLayout(BoxLayout.Y_AXIS)));
		announce = new GeneralPublication(Properties.getInstance().getUrl(), 2);
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
			SpanButton button = new SpanButton(entry.getTitle());
			button.setUIID("MultiButton");
	        
			button.addActionListener((e) -> {
				NavigationPage navigation = new BrowserPage(entry.getTitle(),
						entry.getMessage() + createFootprint(entry.getAuthor(), entry.getDate()));
				navigation.setBackCommand(this.getPage());
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
